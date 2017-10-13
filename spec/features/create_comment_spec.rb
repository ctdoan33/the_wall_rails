require 'rails_helper'
feature "user submits a comment" do
	before(:each) do
		visit "/users/new"
		fill_in "username", with: "Myusername"
		click_button "Sign In"
		fill_in "message", with: "Myusername's message"
		click_button "Post a Message"
	end
	scenario "user submits valid comment" do
		fill_in "comment", with: "A user's message's comment"
		click_button "Post a Comment"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "A user's message's comment"
	end
	scenario "user submits blank comment" do
		click_button "Post a Comment"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "Comment can't be blank"
	end
	scenario "user submits comment 15 characters or less" do
		fill_in "comment", with: "A user's messag"
		click_button "Post a Comment"
		expect(current_path).to eq("/messages")
		expect(page).to have_content "Comment is too short (minimum is 16 characters)"
	end
end