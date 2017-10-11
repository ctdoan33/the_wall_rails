require 'rails_helper'
feature "user registers/logs in" do
	before(:each) do
		visit "/users/new"
	end
	scenario "user successfully creates a new user account and is logged in" do
		fill_in "username", with: "Myusername"
		click_button "Sign In"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "Welcome Myusername"
	end
	scenario "user successfully logged in to existing account" do
		User.create(username: "Myusername")
		fill_in "username", with: "Myusername"
		click_button "Sign In"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "Welcome Myusername"
	end
	scenario "user does not provide username" do
		click_button "Sign In"
		expect(current_path).to eq("/users/new")
		expect(page).to have_content "Username can't be blank"
	end
	scenario "user provides username 5 characters or less" do
		fill_in "username", with: "Myuse"
		click_button "Sign In"
		expect(current_path).to eq("/users/new")
		expect(page).to have_content "Username is too short (minimum is 6 characters)"
	end
end