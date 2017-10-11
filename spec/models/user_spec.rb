require 'rails_helper'

RSpec.describe User, type: :model do
	context "With valid attributes" do 
		it "should save" do 
			expect(build(:user)).to be_valid
		end
	end
	context "With invalid attributes" do
		it "requires username" do
			expect(build(:user, username:'')).to be_invalid
		end
		it "requires unique username" do
			expect(create(:user, username:'myusername')).to be_valid
			expect(build(:user, username:'myusername')).to be_invalid
		end
		it "requires unsername to be longer than 5 characters" do
			expect(build(:user, username:'myuse')).to be_invalid
		end
	end
end
