class ProjectUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :role, :user

  validates :user_id, :uniqueness => {:scope => [:project_id, :role]}
end
