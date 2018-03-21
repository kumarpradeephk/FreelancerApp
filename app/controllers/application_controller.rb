class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?
  before_action :set_current_user
  attr_accessor :current_user

  def logged_in?
  	!!set_current_user
  end

  def require_user
  	if !logged_in?
  		flash[:notice]= "you must be logged in to perform action"
  		redirect_to users_path
  	end
  end

  private
  def set_current_user
  	return unless session[:token].present?
  	@current_user = User.find_by_token(session[:token]) 
  end
end
