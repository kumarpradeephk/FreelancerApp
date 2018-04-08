require "rails_helper"

RSpec.describe "sessions page", :type => :request do
  let(:user_params) do {
    user: {:username => "jdoe", :password => "secret"}
  }
end
it "- after successful login as a hire people - not able to post project" do
  user = User.create!(:username => "jdoe", :email => "jdoe@example.com", :password => "secret", :category =>"hire")
  get login_path
  assert_select "form.new_user" do
    assert_select "input[name=?]", "user[username]"
    assert_select "input[name=?]", "user[password]"
    assert_select "input[type=?]", "submit"
  end
  post "/auth", params: user_params
  current_user = user.token
  response.should redirect_to view_path
end
end
# successfully post new project

RSpec.describe "project page", :type => :request do
  let(:project_params) do {
    project: {:project_name => "skupp", :description => "this is new project", :skill => "Android"}
  }
end
it "- after successful login as a hire people - able to post project" do
user = User.create!(:username => "jdoe", :email => "jdoe@example.com", :password => "secret", :category =>"hire")
#session[:token] = user.token
get new_project_path, nil, {session[:token] => user.token}
#binding.pry
assert_select "form.new_project" do
  assert_select "input[name=?]", "project[project_name]"
  assert_select "textarea[name=?]", "project[description]"
  assert_select "input[name=?]", "project[skill]"
  assert_select "input[type=?]", "submit"
end
binding.pry
post "/projects", params: project_params
response.should redirect_to new_project_path
end
end

# unable to post new project
RSpec.describe "project page", :type => :request do
  let(:project_params) do {
    project: {:project_name => "skupp", :description => "this is new project", :skill => "Android"}
  }
end
it "- after successful login as a hire people - able to post project" do
get new_project_path
assert_select "form.new_project" do
  assert_select "input[name=?]", "project[project_name]"
  assert_select "textarea[name=?]", "project[description]"
  assert_select "input[name=?]", "project[skill]"
  assert_select "input[type=?]", "submit"
end
post "/projects", params: project_params
response.should redirect_to new_project_path
end
end