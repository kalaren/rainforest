require "spec_helper"

describe Review do
 	let(:user) {FactoryGirl.create(:user)}
 	let(:product) {FactoryGirl.create(:product)}
	let(:review) {product.reviews.build(comment: "Hello", user_id: user.id)}

 	subject {review}

 	it {should be_valid}

 	describe "should be invalid without product_id" do
 		before {review.user_id = nil}
 		it {should_not be_valid}
 	end

end