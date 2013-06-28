class Review < ActiveRecord::Base
  attr_accessible :comment, :product_id, :user_id
  belongs_to :user
  belongs_to :product

  default_scope -> { order('created_at DESC') }
end
