class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  # GET /projects/:project_id/comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  # POST /projects/:project_id/comments/
  def create
    @project = Project.find_by_id(params[:project_id])
    puts @project
    if self.current_user.nil?
      redirect_to @project
      flash[:notice] = '请先登录！'
      return
    end

    @comment = @project.comments.build(comment_params)
    @comment.user_id = self.current_user.id

    if @comment.save
      flash[:notice] = 'Comment successfully created.'
      puts 'Comment successfully created.'
    else
      flash[:notice] = '评论失败!'
    end
    redirect_to @project
    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
    #     format.json { render :show, status: :created, location: @comment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :project_id, :content)
    end
end
