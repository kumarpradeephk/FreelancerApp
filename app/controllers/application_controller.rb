class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  attr_accessor :current_user

  private
  def set_current_user
  	return unless session[:token].present?
  	@current_user = User.find_by_token(session[:token]) 
  end

end
