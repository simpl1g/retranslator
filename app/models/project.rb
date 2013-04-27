class Project < ActiveRecord::Base
  attr_accessible :title, :description, :locale_files_attributes

  validates :title, :presence => true

  has_many :locale_files
  belongs_to :user

  accepts_nested_attributes_for :locale_files, :allow_destroy => true

  def owner
    user
  end
end
