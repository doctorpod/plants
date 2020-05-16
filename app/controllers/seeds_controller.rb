class SeedsController < ApplicationController
  before_action :set_seed, only: [:show, :edit, :update, :destroy]

  # GET /seeds
  # GET /seeds.json
  def index
    session[:seeds] ||= {}
    session[:seeds][:filter] = params[:filter] if params[:filter]
    session[:seeds][:sort] = params[:sort] if params[:sort]

    sort_scopes = {
      na: Seed.by_name,
      nd: Seed.by_name(:desc),
      aa: Seed.by_acquired,
      ad: Seed.by_acquired(:desc),
      oa: Seed.by_source,
      od: Seed.by_source(:desc),
      sa: Seed.by_sow_by,
      sd: Seed.by_sow_by(:desc)
    }.stringify_keys
    @seeds = sort_scopes[session[:seeds].symbolize_keys[:sort]] || Seed.by_name

    filter_scopes = {
      ra: Seed.all,
      rt: Seed.current,
      rf: Seed.finished
    }.stringify_keys
    @seeds = @seeds.merge(filter_scopes[session[:seeds].symbolize_keys[:filter]] || Seed.all)
  end

  # GET /seeds/1
  # GET /seeds/1.json
  def show
  end

  # GET /seeds/new
  def new
    @seed = Seed.new
  end

  # GET /seeds/1/edit
  def edit
  end

  # POST /seeds
  # POST /seeds.json
  def create
    @seed = Seed.new(seed_params)

    respond_to do |format|
      if @seed.save
        format.html { redirect_to @seed, notice: 'Seed was successfully created.' }
        format.json { render :show, status: :created, location: @seed }
      else
        format.html { render :new }
        format.json { render json: @seed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seeds/1
  # PATCH/PUT /seeds/1.json
  def update
    respond_to do |format|
      if @seed.update(seed_params)
        format.html { redirect_to @seed, notice: 'Seed was successfully updated.' }
        format.json { render :show, status: :ok, location: @seed }
      else
        format.html { render :edit }
        format.json { render json: @seed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seeds/1
  # DELETE /seeds/1.json
  def destroy
    @seed.destroy
    respond_to do |format|
      format.html { redirect_to seeds_url, notice: 'Seed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seed
      @seed = Seed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seed_params
      params.require(:seed).permit(:name, :acquired, :source, :covered_sowing_months, :direct_sowing_months, :sow_by, :seeds_remaining)
    end
end
