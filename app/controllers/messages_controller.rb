class MessagesController < ApplicationController
	def index
		@user = User.find(session[:id])
		@messages = Message.includes(:user).order(created_at: :desc)
		@comments = Comment.all
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
	def create_comment
		comment = Comment.new(comment: params[:comment], user: User.find(session[:id]), message: Message.find(params[:id]))
		if comment.save
			redirect_to "/messages"
		else
			flash[:errors] = comment.errors.full_messages
			redirect_to "/messages"
		end
	end
end
