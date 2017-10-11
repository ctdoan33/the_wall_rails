class Comment < ActiveRecord::Base
	validates :comment, presence:true, length:{minimum:16}
	validates :user, :message, presence:true
	belongs_to :user
	belongs_to :message
end