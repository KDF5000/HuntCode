class ThirdpartiesController < ApplicationController
  before_action :set_thirdparty, only: [:show, :edit, :update, :destroy]

  # GET /thirdparties
  # GET /thirdparties.json
  def index
    @thirdparties = Thirdparty.all
  end

  # GET /thirdparties/1
  # GET /thirdparties/1.json
  def show
  end

  # GET /thirdparties/new
  def new
    @thirdparty = Thirdparty.new
  end

  # GET /thirdparties/1/edit
  def edit
  end

  # POST /thirdparties
  # POST /thirdparties.json
  def create
    @thirdparty = Thirdparty.new(thirdparty_params)

    respond_to do |format|
      if @thirdparty.save
        format.html { redirect_to @thirdparty, notice: 'Thirdparty was successfully created.' }
        format.json { render :show, status: :created, location: @thirdparty }
      else
        format.html { render :new }
        format.json { render json: @thirdparty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thirdparties/1
  # PATCH/PUT /thirdparties/1.json
  def update
    respond_to do |format|
      if @thirdparty.update(thirdparty_params)
        format.html { redirect_to @thirdparty, notice: 'Thirdparty was successfully updated.' }
        format.json { render :show, status: :ok, location: @thirdparty }
      else
        format.html { render :edit }
        format.json { render json: @thirdparty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thirdparties/1
  # DELETE /thirdparties/1.json
  def destroy
    @thirdparty.destroy
    respond_to do |format|
      format.html { redirect_to thirdparties_url, notice: 'Thirdparty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thirdparty
      @thirdparty = Thirdparty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thirdparty_params
      params.require(:thirdparty).permit(:identifier, :user_id)
    end
end
