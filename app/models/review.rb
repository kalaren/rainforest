class Review < ActiveRecord::Base
  attr_accessible :comment, :product_id, :user_id
end
