require 'rails_helper'
feature "user submits a message" do
	before(:each) do
		visit "/users/new"
		fill_in "username", with: "Myusername"
		click_button "Sign In"
	end
	scenario "user submits valid message" do
		fill_in "message", with: "Myusername's message"
		click_button "Post a Message"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "Myusername's message"
	end
	scenario "user submits blank message" do
		click_button "Post a Message"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "Message can't be blank"
	end
	scenario "user submits message 10 characters or less" do
		fill_in "message", with: "Mymessages"
		click_button "Post a Message"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "Message is too short (minimum is 11 characters)"
	end
end