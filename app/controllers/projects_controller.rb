class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # GET /projects
  # GET /projects.json
  def index
    @user = get_user
    @projects = Project.all
    # render :inline => @projects.to_json
  end

  def get_project_dates
    Project.select("date(created_at) as ordered_date order").group("date(created_at)").order("ordered_date")
  end

  # 按照时间获取项目
  # 其中，time格式：年月日
  def get_projects_by_time
    # 转换为日期格式
    # @projects = Project.where("updated_at >= #{params[:startdate]} AND updated_at <= #{params[:enddate]}")
    @projects = Project.where("updated_at like '#{params[:date]}%'")
    res_data = Array.new

    @projects.each do |project|
      project_data = Hash.new

      star_num = project.stars.all.count
      puts star_num
      stars = project.stars.take(4)  #取前四个

      project_data.store(:project,project)
      project_data.store(:star_num,star_num)
      star_user_list = Array.new

      stars.each do |star|
        user_id = star.user.id
        user_avatar = star.user.avatar
        star_user_list.append({:user_id=>user_id, :user_avatar=>user_avatar})
      end
      project_data.store(:star_users, star_user_list)
      res_data.append(project_data)
    end
    # @res = {:status=>100, :date=>params[:date],:data=>{'project'}}
    puts res_data
    render json: {:status=>100, :date=>params[:date],:data=>res_data}
  end 

  # GET /projects/1
  # GET /projects/1.json
  def show
    @user = get_user
    @project = Project.find(params[:id])
    @comments = @project.comments.all
    puts @comments.to_json
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    # 判断用户是否登录，是否合法用户
    user = get_user
    if user.nil?
      redirect_to 'new' # TODO 非合法用户
    end
    @project = Project.new(project_params)
    # @project = current_user.projects.build(project_params)
    @project.user_id=current_user.id
    #respond_to do |format|
    if @project.save
      #format.html { redirect_to @project, notice: 'Project was successfully created.' }
      #format.json { render :show, status: :created, location: @project }
      flash[:success] = "项目创建成功！"
      redirect_to @project
    else
      #format.html { render :new }
      #format.json { render json: @project.errors, status: :unprocessable_entity }
      render 'new'
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def signed_in_user
      unless signed_in?
        redirect_to '/loginReg', notice: "Please sign in."
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :intro_content, :source_url)
    end
end
