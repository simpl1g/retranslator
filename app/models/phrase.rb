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
      translations = self.phrase_translations
      translations = translations.where(:language_id => languages.map(&:id)) unless languages.blank?
      translations.sort_by(&:language_id)
    else
      []
    end
  end

end
