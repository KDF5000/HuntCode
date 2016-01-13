module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    #这行代码定义了current_user方法，可以在控制器和视图中使用
    #这是一个赋值操作，必须先定义相应的方法才能使用
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  #上面的赋值操作
  def current_user=(user)
    @current_user = user
  end

  #读取@current_user的值，但不会使用@current_user，因为那是暂时的，
  # 我们要使用cookies来访问数据库得到当前用户
  #实际上，实现了att_accessor方法。
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    current_user.update_attribute(:remember_token, nil)
                                  # User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def get_user
    if signed_in?
      @current_user
    else
      nil
    end
  end

end
