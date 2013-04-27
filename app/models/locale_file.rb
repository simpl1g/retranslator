class LocaleFile < ActiveRecord::Base
  mount_uploader :file, LocaleFileUploader

  validates :file, :presence => true

  attr_accessible :file

  belongs_to :project
end