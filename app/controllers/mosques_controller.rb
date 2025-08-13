class MosquesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_mosque, only: %i[ show edit update destroy ]

  # GET /mosques or /mosques.json
  def index
    @q = Mosque.ransack(params[:q])
    @mosques = @q.result
  end

  # GET /mosques/1 or /mosques/1.json
  def show
  end

  # GET /mosques/new
  def new
    @mosque = Mosque.new
    3.times { @mosque.donations.build }
  end

  # GET /mosques/1/edit
  def edit
    3.times { @mosque.donations.build }
  end

  # POST /mosques or /mosques.json
  def create
    @mosque = Mosque.new(mosque_params)

    respond_to do |format|
      if @mosque.save
        format.html { redirect_to @mosque, notice: "Mosque was successfully created." }
        format.json { render :show, status: :created, location: @mosque }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @mosque.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /mosques/1 or /mosques/1.json
  def update
    respond_to do |format|
      if @mosque.update(mosque_params)
        format.html { redirect_to @mosque, notice: "Mosque was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @mosque }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @mosque.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /mosques/1 or /mosques/1.json
  def destroy
    @mosque.destroy!

    respond_to do |format|
      format.html { redirect_to mosques_path, notice: "Mosque was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mosque
      @mosque = Mosque.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mosque_params
      params.expect(mosque: [ :status, :name, :description, :longitude, :latitude, :address, :capacity, :size, :establish_year, :city, :cover_image,
        donations_attributes: [ [ :id, :title, :description, :status, :is_verified, :current_amount, :target_amount, :donor_name, :_destroy ] ] ])
    end
end
