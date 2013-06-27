class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents

  validates :name, :description, presence: true
  validates :price_in_cents, numericality: {only_integer: true}
end
