require 'spec_helper'

describe User do

	before do
		@user = User.new(name: 'Eric', email: 'eric@gmail.com', password: '123', password_confirmation: '123')
	end

	subject {@user}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}

	it {should be_valid}

	describe "when name is not present" do
		before {@user.name = ""}
		it {should_not be_valid}
	end

	describe "when email is not present" do
		before {@user.email = ""}
		it {should_not be_valid}
	end

	describe "cannot have duplicate emails" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it {should_not be_valid}
	end

	describe "mismatched password and confirmation should be invalid" do
		before {@user.password = "456"}
		it {should_not be_valid}
	end

	describe "has many products through reviews" do
		it {should have_many(:products).through(:reviews)}
	end
end