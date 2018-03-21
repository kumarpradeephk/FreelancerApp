class UsersController < ApplicationController

  def index
    #binding.pry
  end

  def home

  end

  def login
  	@login = User.new
  end

  def signup
  	@signup = User.new
  end

  def auth
    begin 
      username = user_params[:user_id]
      password = user_params[:password]
      @user = User.find_by_user_id(username)
      category = @user.category
      raise "Not authenticated" unless @user.authenticate(password)
      session[:token] = @user.token
      flash[:notice] =  " Successfully Logged In as a #{category}"
      if(category=='hire')
        redirect_to new_project_path
      elsif(category=='work')
        redirect_to home_path
      end
    rescue => e 
      flash[:notice] = e.message
      redirect_to login_path
    end
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
