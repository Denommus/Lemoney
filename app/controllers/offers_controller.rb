class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :toggle_disable]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_url, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offers_url, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PUT /offers/1/disable
  # PUT /offers/1/disable.json
  def toggle_disable
    respond_to do |format|
      @offer.update(manual_disable: !@offer.manual_disable, state: :disabled) # The state will be changed to enabled in the worker
      if @offer.manual_disable
        format.html { redirect_to offers_url, notice: 'Offer was successfully disabled.' }
      else
        format.html { redirect_to offers_url, notice: 'Offer was successfully enabled.' }
      end
      format.json { render :show, status: :ok, location: @offer }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium)
    end
end
