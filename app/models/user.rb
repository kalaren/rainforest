class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name
  has_secure_password

  before_save :create_remember_token

  has_many :reviews
  has_many :products, :through => :reviews

  validates_presence_of :password, on: :create
  validates_presence_of :name

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
