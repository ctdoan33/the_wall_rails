require 'rails_helper'

RSpec.describe Message, type: :model do
	context "With valid attributes" do 
		it "should save" do 
			expect(build(:message)).to be_valid
		end
	end
	context "With invalid attributes" do
		it "requires message" do
			expect(build(:message, message:'')).to be_invalid
		end
		it "requires message to be longer than 10 characters" do
			expect(build(:message, message:'mytestmess')).to be_invalid
		end
		it "requires user reference" do
			expect(build(:message, user:nil)).to be_invalid
		end
	end
end
