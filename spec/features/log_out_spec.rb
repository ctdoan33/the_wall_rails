require 'rails_helper'
feature "log out user" do
	before(:each) do
		visit "/users/new"
		fill_in "username", with: "Myusername"
		click_button "Sign In"
	end
	scenario "message path should have Log Out" do
		expect(current_path).to eq("/messages")
		expect(page).to have_link("Log Out")
	end
	scenario "current path should be new user path after clicking log out" do
		expect(current_path).to eq("/messages")
		click_link "Log Out"
		expect(current_path).to eq("/users/new")
	end
end