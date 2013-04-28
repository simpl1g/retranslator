class Language < ActiveRecord::Base
  has_many :translators_languages
  has_many :translators, :through => :translators_languages
  has_many :phrase_translations

  attr_accessible :name
  validates :name, :presence => true

  def title
    I18n.t("language.#{name}")
  end


  def self.languages_for_select
    result = []
    Language.all.each do |language|
      result << [language.title, language.id]
    end
    result
  end
end
