class UsersController < ApplicationController

  def index
    #binding.pry
  end

  def home

  end

  def signup
  	@signup = User.new
  end

  def create
  	begin
  		@user = User.new(user_params)
  		@user.save!
  	rescue => e 
  		flash[:notice] = "something error occured/username already exist/username too short"
  	end
  	redirect_to users_path
  end 

  private
  def user_params
    params.require(:user).permit(:user_id, :email, :password, :category)
  end
end
