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
    puts @user.to_json
    # print "canshushi",params

    # @users = @user..paginate(page: params[:page])
    # @stars = Star.find_by_user_id(@user)
    #点过赞的

    @stared_projects = get_stared_projects
    @shared_projects = get_shared_projects
    @commented_projects = get_commented_projects

    puts @stared_projects.to_json
    puts @shared_projects.to_json
    puts @commented_projects.to_json

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
    @user.avatar = "/images/avatar/default.png" #默认的头像
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

  #
  def github_access_token
    render 'users/access'
  end

  def github_login
    # @code = params[:code]
    # 获取access_token
    puts "获取access_token"
    # data = {client_id:'ea6bbfeb21340b60c869', client_secret:'e6512b8cce7374e6a6d259ee4920b1b8add576f7', code:@code, redirect_uri:"https://"+request.raw_host_with_port+"/github/login"}
    # response = request_post_ssl("https://github.com/login/oauth/access_token",data)
    # info = response.split('&')
    # access_token_arr = info[0].split('=')
    # puts access_token_arr[1]
    # access_token= access_token_arr[1]
    # puts "获取access_token成功!!!!!"
    # #获取用户信息
    # uri = URI.parse('https://api.github.com/user?access_token='+access_token)
    # response = request_get_ssl("https://api.github.com/user?access_token="+access_token)
    # res = JSON.parse response
    # @identifier = res['id']
    # render :json => response.to_json
    # if Thirdparty.exists?(identifier:@identifier)
    #   @thirdParty = Thirdparty.find_by_identifier(@identifier)
    #   print @thirdParty.to_json
    #   begin
    #     @user = User.find(@thirdParty.user_id)
    #     sign_in @user
    #   rescue
    #     puts "查找用户失败"
    #     # redirect_to loginReg_url
    #   end
    # else
    #   #创建一个用户
    #   puts "创建一个用户"
    #   @avatar_url = res['avatar_url']
    #   @user_name = res['login']
    #   @email = res['email']
    #   @user = User.create(:x_username=>@user_name, :avatar=>@avatar_url, :x_email=>@email,:password=>"123456",
    #   :password_confirmation=>"123456")
    #
    #   @thirdParty = Thirdparty.create(:identifier=>@identifier, :user_id=>@user.id)
    #   sign_in @user
    # end
    #
    # redirect_to root_url
  end

  def comments

    @user = get_user
    # print "canshushi",params

    # @users = @user..paginate(page: params[:page])
    # @comments = Comment.find_by_user_id(@user.id)
    @comments = @user.comments.all
    print "canshushi",@comments.to_json
    render "show"
  end

  def stars
    @user = get_user
    # print "canshushi",params

    # @users = @user..paginate(page: params[:page])
    # @stars = Star.find_by_user_id(@user)
    @stars = @user.stars.all
    print "canshushi",@stars.to_json
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

    # 获取用户点赞过的项目
    def get_stared_projects
      @stars = @user.stars.select(:project_id).distinct
      project_list = Array.new
      @stars.each do |star|
        project = star.project
        project_hash = get_project_info(project)
        project_list.append(project_hash)
      end
      return project_list
    end

    #获取用户评论过的项目
    def get_commented_projects
      @comments = @user.comments.select(:project_id).distinct
      project_list = Array.new
      @comments.each do |comment|
        project_hash = Hash.new
        project = comment.project
        project_hash = get_project_info(project)
        project_list.append(project_hash)
      end
      return project_list
    end

    def get_shared_projects
      @projects = @shared_projects = @user.projects.all.distinct
      project_list = Array.new
      @projects.each do |project|
        project_hash = get_project_info(project)
        project_list.append(project_hash)
      end
      return project_list
    end

    def get_project_info(project)
      project_hash = Hash.new
      project_hash.store('project', project)
      project_hash.store('stars_num', project.stars.count)
      top_stars = project.stars.take(4)
      star_user_list = Array.new
      top_stars.each do |data|
        user_hash = Hash.new
        user_hash.store('user_id', data.user.id)
        user_hash.store('user_avatar',data.user.avatar)
        star_user_list.append(user_hash)
      end
      project_hash.store('star_users', star_user_list)
      return project_hash
    end

    def request_post_ssl(url, data)
      #https://github.com/login/oauth/access_token
      uri = URI.parse(url)
      # data = {client_id:'ea6bbfeb21340b60c869', client_secret:'e6512b8cce7374e6a6d259ee4920b1b8add576f7', code:@code, redirect_uri:"http://"+request.raw_host_with_port+"/github/login"}
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(data)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      response = http.request(request)

      return response.body
    end

    def request_get_ssl(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri.request_uri)

      response = http.request(request)
      return response.body
    end
end
