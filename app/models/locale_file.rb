class LocaleFile < ActiveRecord::Base
  mount_uploader :file, LocaleFileUploader
  belongs_to :project
  has_many :phrases, :dependent => :destroy
  has_many :phrase_translations, :through => :phrases

  validates :file_type, :presence => true
  validates_inclusion_of :file_type, :in => FileType

  attr_accessible :file, :name, :file_type

  enumerate :file_type, :with => FileType

  before_save :update_asset_attributes

  before_validation :set_default_file_name

  def import_phrases(user, hash=nil, language=nil)
    parser = ReTranslator::Parser::Ruby::Yaml.new(self.file.path)
    language ||= Language.find_by_name(parser.locale)
    hash ||= parser.phrases
    self.class.transaction do
      add_phrases(user, hash, language)
    end
  end

  def add_phrases(user, hash, language, parent=nil)
    hash.each do |key, value|
      case value.class.to_s
      when "String"
        phrase = add_phrase(key, value, user, language, parent)
      when "Array"
        value.each do |element|
          phrase = add_complicated_phrase(key)
          add_phrases(user, element, language, phrase)
        end
      when "Hash"
        phrase = add_complicated_phrase(key)
        logger.debug("user=#{user}, value=#{value}, language=#{language}, phrase=#{phrase}")
        add_phrases(user, value, language, phrase)
      else
        raise "Error"
      end
    end
  end

  def add_phrase(key, value, user, language, parent)
    phrase = phrases.create(:name => key, :complicated => false, :parent => parent, :phrase_translations_attributes => [{:value => value, :user_id => user.id, :language_id => language.id}])
  end

  def add_complicated_phrase(key)
    phrase = phrases.create(:name => key, :complicated => true)
  end


  private

  def set_default_file_name
    self.name = "new_file_#{Time.now.to_i}" if self.name.blank?
  end

  def update_asset_attributes
    if file.present? && file_changed?
      self.name = file.file.original_filename
    end
  end

end
