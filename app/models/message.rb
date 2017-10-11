class Message < ActiveRecord::Base
	validates :message, presence:true, length:{minimum:11}
	validates :user, presence:true
	belongs_to :user
end
