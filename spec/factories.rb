FactoryGirl.define do
	factory :user do
		name "123"
		email "123"
		# sequence(:name) { |n| "Person #{n}" }
		# sequence(:email) { |n| "Person#{n}@gmail.com" }
		password "123"
		password_confirmation "123"
	end

	factory :product do
		sequence(:name) { |n| "Box #{n}" }
		sequence(:description) { |n| "This is a box numbered #{n}" }
		sequence(:price_in_cents) { |n| "#{n}" }
	end

	factory :review do
		comment "Lorem Ipsum"
		user
		product
	end
end