require 'spec_helper'

describe Product do

	before do
		@product = Product.new(name: 'Box', description: 'There are no boxes', price_in_cents: "5000")
	end

	subject {@product}

	it {should respond_to(:name)}
	it {should respond_to(:description)}
	it {should respond_to(:price_in_cents)}
	it {should respond_to(:formatted_price)}

	its(:price_in_cents) {should be_a(Integer)}

	it {should be_valid}

	describe "when name is not present" do
		before {@product.name = ""}
		it {should_not be_valid}
	end

	describe "when description is not present" do
		before {@product.description = ""}
		it {should_not be_valid}
	end

	describe "when price_in_cents is not present" do
		before {@product.price_in_cents = ""}
		it {should_not be_valid}
	end

	describe "products can have reviews" do
		let(:user) {FactoryGirl.create(:user)}
		let(:product) {FactoryGirl.create(:product)}
		let!(:r_one) {FactoryGirl.create(:review, product: product, user: user)}

		specify {product.reviews.count.should == 1}
		describe "more than one" do
			let!(:r_two) {FactoryGirl.create(:review, product: product, user: user)}

			specify {product.reviews.count.should == 2}
		end
	end

	describe "should have many users through reviews" do
		it {should have_many(:users).through(:reviews)}
	end



	

end