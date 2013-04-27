class Translator < ActiveRecord::Base
  has_many :translators_languages
  has_many :languages, :through => :translators_languages

  attr_accessible :description
  belongs_to :user


end
