class SeedsController < ApplicationController
  before_action :set_seed, only: [:show, :edit, :update, :destroy]
  before_action :set_sort, only: :index
  before_action :set_filter, only: :index

  # GET /seeds
  # GET /seeds.json
  def index
    @seeds = Seed.where(session[:where]).order(session[:sort])
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

    def set_sort
      sort_clause = {
        na: 'name ASC',
        nd: 'name DESC',
        aa: 'acquired ASC',
        ad: 'acquired DESC',
        oa: 'source ASC',
        od: 'source DESC',
        sa: 'sow_by ASC',
        sd: 'sow_by DESC'
      }

      session[:sort] = if params[:sort]
        sort_clause[params[:sort].to_sym]
      else
        session[:sort] || sort_clause[:na]
      end
    end

    def set_filter
      where_clause = {
        ra: '',
        rt: 'seeds_remaining IS TRUE',
        rf: 'seeds_remaining IS FALSE'
      }

      session[:where] = if params[:filter]
        where_clause[params[:filter].to_sym]
      else
        session[:where] || where_clause[:rt]
      end
    end
end
