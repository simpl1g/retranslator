class Language < ActiveRecord::Base
  has_many :translators_languages
  has_many :translators, :through => :translators_languages

  attr_accessible :name
  validates :name, :presence => true

end
