class SubscribesController < ApplicationController
  before_action :set_subscribe, only: [:show, :edit, :update, :destroy]

  # GET /subscribes
  # GET /subscribes.json
  def index
    @subscribes = Subscribe.all
  end

  # GET /subscribes/1
  # GET /subscribes/1.json
  def show
  end

  # GET /subscribes/new
  def new
    @subscribe = Subscribe.new
  end

  # GET /subscribes/1/edit
  def edit
  end

  # POST /subscribes
  # POST /subscribes.json
  def create
    sub_email = params[:sub_email]
    status = params[:status].to_i
    if Subscribe.exists?(sub_email: sub_email)
      @subscribe = Subscribe.find_by_sub_email(sub_email)
      @subscribe.status = status
      @subscribe.save
    else
      @subscribe = Subscribe.new
      @subscribe.sub_email = sub_email
      @subscribe.status = status
      @subscribe.save
    end
    msg = '订阅成功'
    if status == 0
      msg = '取消订阅成功！'
    else
      @projects = Project.take(10)
      puts @projects.to_json
      # 发送一个邮件
      UserMailer.send_mail(@projects, sub_email, 'HuntCode每周项目精选', request.raw_host_with_port).deliver_later
    end
    render :json=>{:status=>100, :msg=>msg}
  end

  # PATCH/PUT /subscribes/1
  # PATCH/PUT /subscribes/1.json
  def update
    respond_to do |format|
      if @subscribe.update(subscribe_params)
        format.html { redirect_to @subscribe, notice: 'Subscribe was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscribe }
      else
        format.html { render :edit }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribes/1
  # DELETE /subscribes/1.json
  def destroy
    @subscribe.destroy
    respond_to do |format|
      format.html { redirect_to subscribes_url, notice: 'Subscribe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribe
      @subscribe = Subscribe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscribe_params
      params.require(:subscribe).permit(:sub_email, :status)
    end
end
