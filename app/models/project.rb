class Project < ActiveRecord::Base
  attr_accessible :title, :description, :locale_files_attributes

  validates :title, :presence => true

  has_many :locale_files

  accepts_nested_attributes_for :locale_files, :allow_destroy => true
end
