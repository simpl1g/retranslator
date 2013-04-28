class Project < ActiveRecord::Base
  attr_accessible :title, :description, :project_languages_attributes, :project_type

  validates :title, :presence => true

  validates :user, :presence => true

  has_many :locale_files
  has_many :project_languages
  has_many :languages, :through => :project_languages
  has_many :project_users
  has_many :involved_users, :through => :project_users, :source => :user
  has_many :translators, :through => :involved_users, :conditions => {:project_users => {:role => Role['translator']}}

  belongs_to :user

  accepts_nested_attributes_for :project_languages, :allow_destroy => true

  enumerate :project_type, :with => ProjectType

  scope :show_public, where(:project_type => ProjectType[:public])
  def owner
    user
  end
end
