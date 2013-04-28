class Translator < ActiveRecord::Base
  has_many :translators_languages
  has_many :languages, :through => :translators_languages

  attr_accessible :description, :avatar, :name, :languages_attributes, :user_id
  belongs_to :user

  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "80x80" }

  accepts_nested_attributes_for :languages, :allow_destroy => true
end
