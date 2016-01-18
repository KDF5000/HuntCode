require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "creat user" do
    @user = User.new
    @user.x_email = 'user5@huntcode.com'
    @user.x_username = "user_5"
    @user.password = '123456'
    @user.avatar = '/images/avatar/qiaoyang.png'
    @user.intro=  "IT`S IS MAGIC`"
    @user.job = "设计狮"
    @user.password_confirmation ='123456'
    @user.admin = true
    # puts @user.to_json
    assert @user.save
  end

  test "create without info" do
    user = User.new
    assert_not user.save
  end
end
