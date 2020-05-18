class GrowingStagesController < ApplicationController
  before_action :set_growing_stage, only: [:show, :edit, :update, :destroy]

  # GET /growing_stages
  # GET /growing_stages.json
  def index
    @growing_stages = GrowingStage.all
  end

  # GET /growing_stages/1
  # GET /growing_stages/1.json
  def show
  end

  # GET /growing_stages/new?growing_id=:growing_id
  def new
    growing = Growing.find(params[:growing_id])
    @growing_stage = growing.growing_stages.build
  end

  # GET /growing_stages/1/edit
  def edit
  end

  # POST /growing_stages
  # POST /growing_stages.json
  def create
    @growing_stage = GrowingStage.new(growing_stage_params)

    respond_to do |format|
      if @growing_stage.save
        format.html { redirect_to @growing_stage, notice: 'Growing stage was successfully created.' }
        format.json { render :show, status: :created, location: @growing_stage }
      else
        format.html { render :new }
        format.json { render json: @growing_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growing_stages/1
  # PATCH/PUT /growing_stages/1.json
  def update
    respond_to do |format|
      if @growing_stage.update(growing_stage_params)
        format.html { redirect_to @growing_stage, notice: 'Growing stage was successfully updated.' }
        format.json { render :show, status: :ok, location: @growing_stage }
      else
        format.html { render :edit }
        format.json { render json: @growing_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growing_stages/1
  # DELETE /growing_stages/1.json
  def destroy
    @growing_stage.destroy
    respond_to do |format|
      format.html { redirect_to growing_stages_url, notice: 'Growing stage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growing_stage
      @growing_stage = GrowingStage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def growing_stage_params
      params.require(:growing_stage).permit(:growing_id, :stage_type, :started_on, :growing_medium, :location, :first_growth_on, :num_started, :num_growing, :num_lost, :notes)
    end
end
