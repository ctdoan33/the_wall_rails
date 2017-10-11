class User < ActiveRecord::Base
	validates :username, presence:true, uniqueness:{case_sensitive:false}, length:{minimum:6}
	has_many :messages
	has_many :comments
end
