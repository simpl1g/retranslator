class Language < ActiveRecord::Base
  has_many :translators_languages
  has_many :translators, :through => :translators_languages
  has_many :phrase_translations

  attr_accessible :name, :level
  validates :name, :presence => true

  enumerate :level, :with => LanguageLevel

  def title
    I18n.t("language.#{name}")
  end

  def self.languages_for_select
    result = []
    Language.all.each do |language|
      result << [language.title, language.name]
    end
    result
  end
end
