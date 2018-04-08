class SessionsController < ApplicationController
	def login
		@login = User.new
	end

	def auth
		begin 
			username = user_params[:username]
			password = user_params[:password]
			@user = User.find_by_username(username)
			category = @user.category
			raise "Not authenticated" unless @user.authenticate(password)
			session[:token] = @user.token
			flash[:success] =  " Successfully Logged In as a #{category} person"
			if(category=='hire')
				redirect_to view_path
			elsif(category=='work')
				redirect_to home_path
			end
		rescue => e 
			flash[:notice] = "Invalid username/password"
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
