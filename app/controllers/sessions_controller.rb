class SessionsController < ApplicationController
  def login
  	@login = User.new
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
      redirect_to sessions_login_path
    end
  end

  def logout
  	session[:token] = nil
  	flash[:notice] =  " you have successfully logout"
  	redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:user_id, :email, :password, :category)
  end
end
