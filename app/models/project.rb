class Project < ActiveRecord::Base
  attr_accessible :title, :description, :locale_files_attributes, :project_type

  validates :title, :presence => true

  validates :user, :presence => true

  has_many :locale_files
  belongs_to :user

  accepts_nested_attributes_for :locale_files, :allow_destroy => true

  enumerate :project_type, :with => ProjectType

  scope :show_public, where(:project_type => ProjectType[:public])
  def owner
    user
  end
end
