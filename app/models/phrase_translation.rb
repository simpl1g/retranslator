class PhraseTranslation < ActiveRecord::Base
  attr_accessible :language_id, :version_number, :text

  belongs_to :phrase
  belongs_to :user

  validates :text, :user, :phrase, :language_id, :presence => true
end
