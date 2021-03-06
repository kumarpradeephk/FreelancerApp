class SessionsController < ApplicationController
  def login
    @login = User.new
  end

  def auth
    begin 
      @user = User.find_by_username(user_params[:username])
      raise "username not exist" unless @user
      raise "Not authenticated/invalid password" unless @user.authenticate(user_params[:password])
      category = @user.category
      session[:token] = @user.token
      flash[:success] =  " Successfully Logged In as a #{category} person"
      if(category=='hire')
        redirect_to view_path
      elsif(category=='work')
        redirect_to home_path
      end
    rescue => e 
      flash[:notice] = e
      redirect_to login_path
    end
  end

  def logout
    if session[:token]
      session[:token] = nil
      flash[:notice] =  " you have successfully loged out"
      redirect_to users_path
    else
      flash[:notice] =  " you have already loged out"
      redirect_to users_path
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :category)
  end
end
