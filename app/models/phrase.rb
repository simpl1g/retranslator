class Phrase < ActiveRecord::Base
  belongs_to :locale_file
  has_many :phrase_translations

  attr_accessible :ancestry, :name, :phrase_translations_attributes, :complicated, :parent

  validates :name, :presence => true

  accepts_nested_attributes_for :phrase_translations

  has_ancestry

  before_validation(:on => :create) do
    if phrase_translations
      phrase_translations.each { |ph| ph.phrase = self }
    end
  end

  def phrase_translations_by_languages(languages=[])
    unless self.complicated?
      languages = Language.where(:name => %w(en de fr ru))
      translations = self.phrase_translations
      unless languages.blank?
        translations = translations.where(:language_id => languages.map(&:id))
        languages.each do |lang|
          unless translations.find { |t| t.language_id == lang.id }
            translations << self.phrase_translations.build(:language_id => lang.id)
          end
        end
      end
      translations.sort_by(&:language_id)
    else
      []
    end
  end

end
