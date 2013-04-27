class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  enumerate :role, :with => Role
  has_one :translator

  has_many :projects

  def is? role_name
    self.role == Role[role_name]
  end
end
