class ProjectLanguage < ActiveRecord::Base
  attr_accessible :language_id

  belongs_to :project
  belongs_to :language
end
