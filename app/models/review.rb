class Review < ActiveRecord::Base
  attr_accessible :comment, :product_id, :user_id
  belongs_to :user
  belongs_to :product

  validates :comment, :user_id, presence: true

  default_scope -> { order('created_at DESC') }
end
