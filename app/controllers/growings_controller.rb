class GrowingsController < ApplicationController
  before_action :set_growing, only: [:show, :edit, :update, :destroy]

  # GET /growings
  # GET /growings.json
  def index
    @growings = Growing.all
  end

  # GET /growings/1
  # GET /growings/1.json
  def show
  end

  # GET /growings/new
  def new
    @growing = Growing.new
  end

  # GET /growings/1/edit
  def edit
  end

  # POST /growings
  # POST /growings.json
  def create
    @growing = Growing.new(growing_params)

    respond_to do |format|
      if @growing.save
        format.html { redirect_to @growing, notice: 'Growing was successfully created.' }
        format.json { render :show, status: :created, location: @growing }
      else
        format.html { render :new }
        format.json { render json: @growing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growings/1
  # PATCH/PUT /growings/1.json
  def update
    respond_to do |format|
      if @growing.update(growing_params)
        format.html { redirect_to @growing, notice: 'Growing was successfully updated.' }
        format.json { render :show, status: :ok, location: @growing }
      else
        format.html { render :edit }
        format.json { render json: @growing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growings/1
  # DELETE /growings/1.json
  def destroy
    @growing.destroy
    respond_to do |format|
      format.html { redirect_to growings_url, notice: 'Growing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growing
      @growing = Growing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def growing_params
      params
        .require(:growing)
        .permit(:seed_id, :name, :for_sale)
    end
end
