class SowingsController < ApplicationController
  before_action :set_seed
  before_action :set_sowing, only: [:show, :edit, :update, :destroy]

  # GET /seeds/:seed_id/sowings
  # GET /seeds/:seed_id/sowings.json
  def index
    @sowings = @seed.sowings
  end

  # GET /sowings/1
  # GET /sowings/1.json
  def show
  end

  # GET /seeds/:seed_id/sowings/new
  def new
    @sowing = @seed.sowings.build
  end

  # GET /sowings/1/edit
  def edit
  end

  # POST /seeds/:seed:id/sowings
  # POST /seeds/:seed:id/sowings.json
  def create
    @sowing = @seed.sowings.new(sowing_params)

    respond_to do |format|
      if @sowing.save
        format.html { redirect_to [@seed, @sowing], notice: 'Sowing was successfully created.' }
        format.json { render :show, status: :created, location: @sowing }
      else
        format.html { render :new }
        format.json { render json: @sowing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sowings/1
  # PATCH/PUT /sowings/1.json
  def update
    respond_to do |format|
      if @sowing.update(sowing_params)
        format.html { redirect_to [@seed, @sowing], notice: 'Sowing was successfully updated.' }
        format.json { render :show, status: :ok, location: @sowing }
      else
        format.html { render :edit }
        format.json { render json: @sowing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sowings/1
  # DELETE /sowings/1.json
  def destroy
    @sowing.destroy
    respond_to do |format|
      format.html { redirect_to seed_sowings_url(@seed), notice: 'Sowing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sowing
      @sowing = Sowing.find(params[:id])
    end

    def set_seed
      @seed = Seed.find(params[:seed_id])
    end

    # Only allow a list of trusted parameters through.
    def sowing_params
      params
        .require(:sowing)
        .permit(:references, :sown_on, :compost_mix, :location, :notes, :num_sown, :num_germinated, :first_germinated_on, :potted_on, :planted_out)
    end
end
