class TranslatorsLanguage < ActiveRecord::Base
  belongs_to :translator
  belongs_to :language

  attr_accessible :transactor_id, :language_id, :description, :level
end