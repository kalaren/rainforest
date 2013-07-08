require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "Should have content 'Products' " do
	  visit root_path
	  page.should have_content('Products')
    end
  end
end
