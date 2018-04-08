require "rails_helper"

RSpec.describe "sessions page", :type => :request do
  let(:user_params) do {
    user: {:username => "jdoe", :password => "secret"}
  }
end
it "displays successful login as hiring person" do
   #setup
   user = User.create!(:username => "jdoe", :email => "jdoe@example.com", :password => "secret", :category =>"hire")
   get login_path
   assert_select "form.new_user" do
    assert_select "input[name=?]", "user[username]"
    assert_select "input[name=?]", "user[password]"
    assert_select "input[type=?]", "submit"
  end
  #exercise
  post "/auth", params: user_params
  #verify
  expect(response).to redirect_to view_path
end
end

RSpec.describe "sessions page", :type => :request do
  let(:user_params) do {
    user: {:username => "jdoe1", :password => "secret1"}
  }
end
it "displays successful login as a working person" do
  user = User.create!(:username => "jdoe1", :email => "jdoe@example.com", :password => "secret1", :category =>"work")
  get login_path
  assert_select "form.new_user" do
    assert_select "input[name=?]", "user[username]"
    assert_select "input[name=?]", "user[password]"
    assert_select "input[type=?]", "submit"
  end
  post "/auth", params: user_params
  response.should redirect_to home_path
end
end