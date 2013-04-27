class PhraseTranslation < ActiveRecord::Base
  attr_accessible :language_id, :text, :user

  belongs_to :phrase
  belongs_to :user
  has_many :translation_histories

  validates :text, :user, :phrase, :language_id, :presence => true
  validates :version_number, :uniqueness => {:scope => [:phrase_id, :language_id]}

  before_save :save_history

  private

  def save_history
    if changed_attributes['text']
      translation_histories.build(:text => changed_attributes['text'], :user_id => user_id, :version_number => version_number + 1)
    end
  end
end
