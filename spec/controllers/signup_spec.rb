require "rails_helper"
require './app/controllers/users_controller.rb'

 # if signup will be successfull the redirect to login page otherwise redirect to 
 # 	signup page
 
RSpec.describe "signup page", :type => :request do
  
  let(:user_params) do {
    user: {:username => "jondoe", :email => "jdoe@gmail.com", :password => "secret1", :category => "work"}
  }	
end

	it "will give successfull signup meggage" do
		
		get signup_path
		assert_select "form.new_user" do
		assert_select "input[name=?]", "user[username]"
		assert_select "input[name=?]", "user[email]"
		assert_select "input[name=?]", "user[password]"
		assert_select "input[name=?]", "user[category]"
		end 

		post "/users", params: user_params
		response.should redirect_to login_path
	end
end

RSpec.describe "signup page", :type => :request do
  
  let(:user_params) do {
    user: {:username => " ", :email => "jdoe@gmail.com", :password => "secret1", :category => "work"}
  }	
end

	it "will give unsuccessfull signup meggage" do
		
		get signup_path
		assert_select "form.new_user" do
		assert_select "input[name=?]", "user[username]"
		assert_select "input[name=?]", "user[email]"
		assert_select "input[name=?]", "user[password]"
		assert_select "input[name=?]", "user[category]"
		end 

		post "/users", params: user_params
		response.should redirect_to signup_path
	end
end