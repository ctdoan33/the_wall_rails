class UsersController < ApplicationController
	def new
	end
	def create
		user = User.find_by(username: params[:username])
		if user
			session[:id] = user[:id]
			redirect_to "/messages"
		else
			user = User.new(username:params[:username])
			if user.save
				session[:id] = User.last.id
				redirect_to "/messages"
			else
				flash[:errors] = user.errors.full_messages
				redirect_to "/users/new"
			end
		end
	end
	def logout
		session.clear
		redirect_to "/users/new"
	end
end
