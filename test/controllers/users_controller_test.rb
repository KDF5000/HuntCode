require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:user_1)
  end


  test "should get new" do
    get :new
    assert_template 'users/loginReg.html'
  end

  test "should create user" do
    post :create, user: { x_username: @user.x_username, password: @user.password_digest,x_email: @user.x_email, avatar: @user.avatar, intro: @user.intro, job: @user.job}

    assert_template '/' or 'users/loginReg.html'
  end
end
