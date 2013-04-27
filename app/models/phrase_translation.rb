class PhraseTranslation < ActiveRecord::Base
  attr_accessible :language_id, :value, :user_id, :phrase_id

  belongs_to :phrase
  belongs_to :user
  belongs_to :language
  has_many :translation_histories

  validates :value, :user_id, :phrase, :language_id, :presence => true
  validates :version_number, :uniqueness => {:scope => [:phrase_id, :language_id]}

  before_save :save_history

  private

  def save_history
    if changed_attributes['value']
      translation_histories.build(:value => changed_attributes['value'], :user_id => user_id, :version_number => version_number + 1)
    end
  end
end
