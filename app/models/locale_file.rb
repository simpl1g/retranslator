class LocaleFile < ActiveRecord::Base
  mount_uploader :file, LocaleFileUploader
  belongs_to :project
  has_many :phrases, :dependent => :destroy

  validates :file_type, :presence => true
  validates_inclusion_of :file_type, :in => FileType

  attr_accessible :file, :name, :file_type

  enumerate :file_type, :with => FileType

  before_save :update_asset_attributes

  before_validation :set_default_file_name

  private

  def set_default_file_name
    self.name = "new_file_#{Time.now.to_i}" if self.name.blank?
  end

  def update_asset_attributes
    if file.present? && file_changed?
      self.name = file.file.original_filename
    end
  end

end
