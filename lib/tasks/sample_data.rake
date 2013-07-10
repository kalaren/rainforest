namespace :db do
	desc "Fill db with sample data"
	task populate: :environment do
		User.create!(name: "Eric",
					 email: "eric@gmail.com",
					 password: "123",
					 password_confirmation: "123")
		50.times do |n|
			name = Faker::Name.name
			email = "rainforest-#{n+1}@gmail.com"
			password = "password"
			User.create!(name: name,
						 email: email,
						 password: password,
						 password_confirmation: password)
		end
		50.times do |n|
			name = Faker::Company.name
			description = Faker::Company.catch_phrase
			Product.create!(name: name,
							description: description,
							price_in_cents: "#{n+101}")
		end
	end
end