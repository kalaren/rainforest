class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :reviews
  has_many :products, :through => :reviews

  validates_presence_of :password, on: :create
end
