class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]

  # GET /stars
  # GET /stars.json
  def index
    @stars = Star.all
  end

  # GET /stars/1
  # GET /stars/1.json
  def show
  end

  # GET /stars/new
  def new
    @star = Star.new
  end

  # GET /stars/1/edit
  def edit
  end

  # POST /stars
  # POST /stars.json
  # POST /project/:project_id/stars/
  def create
    @project = Project.find_by_id(params[:project_id])
    puts @project
    if self.current_user.nil?
      flash[:notice] = '请先登录！'
      render :json=>{:status=>102, :msg=>"请先登录!"}.to_json
      return
    end

    @star = @project.stars.new
    @star.user_id = self.current_user.id

    if @star.save
      flash[:notice] = 'Star successfully created.'
      puts 'Star successfully created.'
    else
      flash[:notice] = '点赞失败!'
      render :json=>{:status=>102, :msg=>"点赞失败!"}.to_json
    end
    render :json=>{:status=>100, :msg=>"点赞成功!"}.to_json
  end

  # PATCH/PUT /stars/1
  # PATCH/PUT /stars/1.json
  def update
    respond_to do |format|
      if @star.update(star_params)
        format.html { redirect_to @star, notice: 'Star was successfully updated.' }
        format.json { render :show, status: :ok, location: @star }
      else
        format.html { render :edit }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stars/1
  # DELETE /stars/1.json
  def destroy
    @star.destroy
    respond_to do |format|
      format.html { redirect_to stars_url, notice: 'Star was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_star
      @star = Star.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def star_params
      params.require(:star).permit(:user_id, :project_id)
    end
end
