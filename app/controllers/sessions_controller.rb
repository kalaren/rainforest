class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to products_url, notice: "Now logged in."
		else
			flash.now[:alert] = "Invalid email or password."
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
