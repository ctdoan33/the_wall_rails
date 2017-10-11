class Message < ActiveRecord::Base
	validates :message, presence:true, length:{minimum:11}
	validates :user, presence:true
	has_many :comments
	belongs_to :user
end
