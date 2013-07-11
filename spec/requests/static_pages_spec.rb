require 'spec_helper'

describe "StaticPages" do

  
  describe "Pages before sign in" do

    it "should have content 'Products' " do
	  visit root_path
	  page.should have_content('Products')
    end

    it "should redirect to login page" do
    	visit new_product_path
    	page.should have_content('Please sign in.')
    end

    it "should have content 'Sign up' " do
    	visit new_user_path
    	page.should have_content('Sign Up')
    end
  end

  describe "pages after sign in" do
    let(:user) {FactoryGirl.create(:user)}
    before do
      sign_in user
      visit root_path
    end

    it "should have logout" do
      page.should have_content('Log Out')
    end
  end


end
