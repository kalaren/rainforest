class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents
  has_many :reviews
  had_many :users, through: :reviews

  validates :name, :description, presence: true
  validates :price_in_cents, numericality: {only_integer: true}

  def formatted_price
  	price_in_dollars = price_in_cents.to_f / 100
  	sprintf("%.2f", price_in_dollars)
  end
end