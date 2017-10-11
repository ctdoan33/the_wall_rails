require 'rails_helper'

RSpec.describe Comment, type: :model do
	context "With valid attributes" do 
		it "should save" do 
			expect(build(:comment)).to be_valid
		end
	end
	context "With invalid attributes" do
		it "requires comment" do
			expect(build(:comment, comment:'')).to be_invalid
		end
		it "requires comment to be longer than 15 characters" do
			expect(build(:comment, comment:"A user's commen")).to be_invalid
		end
		it "requires user reference" do
			expect(build(:comment, user:nil)).to be_invalid
		end
		it "requires message reference" do
			expect(build(:comment, message:nil)).to be_invalid
		end
	end
end
