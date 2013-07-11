class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
      sign_in @user
  		redirect_to root_path, notice: "You've signed up!"
  	else
  		render "new"
  	end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to user_path(@user), notice: "Updated Successfully"
    else
      render 'edit'
    end
  end
end
