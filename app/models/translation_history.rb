class TranslationHistory < ActiveRecord::Base
  attr_accessible :text, :version_number

  belongs_to :phrase_translation
  belongs_to :user

  validates :text, :version_number, :user, :phrase_translation, :presence => true
end
