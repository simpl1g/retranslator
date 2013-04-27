class TranslationHistory < ActiveRecord::Base
  attr_accessible :value, :user_id, :version_number

  belongs_to :phrase_translation
  belongs_to :user

  validates :value, :user, :phrase_translation, :version_number, :presence => true
  validates :version_number, :uniqueness => {:scope => :phrase_translation_id}

  after_save :update_version_number

  private

  def update_version_number
    phrase_translation.update_attribute(:version_number, version_number)
  end
end
