require 'spec_helper'

describe "Static pages" do

	describe "Home page" do

		it "should have the content 'Library'" do
			visit root_path
			expect(page).to have_content('Library')
		end
		it "should have the title 'Home'" do
			visit root_path
			expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
		end
	end
	describe "Help page" do

		it "should have the content 'Help'" do
			visit help_path
			expect(page).to have_content('Help')
		end
		it "should have the title 'Help'" do
			visit help_path
			expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
		end
	end
	describe "About page" do

		it "should have the content 'About'" do
			visit about_path
			expect(page).to have_content('About')
		end
		it "should have the title 'About'" do
			visit about_path
			expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
		end
	end
end