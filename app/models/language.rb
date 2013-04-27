class Language < ActiveRecord::Base
  has_many :translators_languages
  has_many :translators, :through => :translators_languages
  has_many :phrase_translations

  attr_accessible :name
  validates :name, :presence => true

end
