class Phrase < ActiveRecord::Base
  attr_accessible :ancestry, :name

  validates :name, :presence => true

  belongs_to :locale_file
end
