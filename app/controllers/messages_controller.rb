class MessagesController < ApplicationController
	def index
		@user = User.find(session[:id])
		@messages = Message.all.order(created_at: :desc)
	end
	def create
		message = Message.new(message: params[:message], user: User.find(session[:id]))
		if message.save
			redirect_to "/messages"
		else
			flash[:errors] = message.errors.full_messages
			redirect_to "/messages"
		end
	end
end
