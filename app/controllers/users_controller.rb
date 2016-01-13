class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :show, :update]
  before_action :admin_user,     only: [:index, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render :inline => @users.to_json
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    render "users/show.html.erb"
  end

  # GET /users/new
  def new
    render "users/loginReg.html"
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    # respond_to do |format|
    if @user.save
      sign_in(@user)
      # format.html { redirect_to @user, notice: 'User was successfully created.' }
      # format.json { render :show, status: :created, location: @user }
      flash[:success] = "Welcome to Huntcode!"
      redirect_to "/"
    else
      # format.html { render :new }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      # print @user.errors.to_json
      render 'users/loginReg.html'
    end
    # end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # respond_to do |format|
    if @user.update(user_params)
      # format.html { redirect_to @user, notice: 'User was successfully updated.' }
      # format.json { render :show, status: :ok, location: @user }
      flash[:success] = "Profile updated"
      print @user.to_json
      render "users/show.html.erb"
    else
      # format.html { render :edit }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      print @user.errors.to_json
      render "users/show.html.erb"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def github_login
    require 'json'
    @code = params[:code]
    # 获取access_token
    uri = URI.parse("https://github.com/login/oauth/access_token")
    data = {client_id:'ea6bbfeb21340b60c869', client_secret:'e6512b8cce7374e6a6d259ee4920b1b8add576f7', code:@code, redirect_uri:"http://localhost:3000/github/login"}
    res = Net::HTTP.post_form(uri, data)
    info = res.body.split('&')
    access_token_arr = info[0].split('=')
    puts access_token_arr[1]
    access_token= access_token_arr[1]
    #获取用户信息
    uri = URI.parse('https://api.github.com/user?access_token='+access_token)
    response = Net::HTTP.get(uri)
    res = JSON.parse response
    @identifier = res['id']

    if Thirdparty.exists?(identifier:@identifier)
      @thirdParty = Thirdparty.find_by_identifier(@identifier)
      print @thirdParty.to_json
      begin
        @user = User.find(@thirdParty.user_id)
        sign_in @user
      rescue
        puts "查找用户失败"
        redirect_to loginReg_url
      end
    else
      #创建一个用户
      puts "创建一个用户"
      @avatar_url = res['avatar_url']
      @user_name = res['login']
      @email = res['email']
      @user = User.create(:x_username=>@user_name, :avatar=>@avatar_url, :x_email=>@email,:password=>"123456",
      :password_confirmation=>"123456")

      @thirdParty = Thirdparty.create(:identifier=>@identifier, :user_id=>@user.id)
      sign_in @user
    end

    redirect_to root_url
  end

  def comments
    @title = "Following"
    @user = User.find(params[:id])
    # print "canshushi",params

    # @users = @user..paginate(page: params[:page])
    @comments = Comment.find_by_user_id(@user.id)
    print "canshushi",@comments.to_json
    render "show"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.

    def user_params
      params.require(:user).permit(:x_username, :x_email, :password,:password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless not current_user.nil? and current_user.admin?
    end
end
