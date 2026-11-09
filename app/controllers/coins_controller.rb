class CoinsController < ApplicationController
  before_action :set_coin, only: %i[ show edit update destroy ]

  # GET /coins or /coins.json
  def index
    @coins = Coin.page(params[:page]).per(20)
  end

  # GET /coins/1 or /coins/1.json
  def show
  end

  # GET /coins/new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins or /coins.json
  def create
    @coin = Coin.new(coin_params)

    respond_to do |format|
      if @coin.save
        format.html { redirect_to @coin, notice: "Coin was successfully created." }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @coin.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /coins/1 or /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to @coin, notice: "Coin was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @coin.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /coins/1 or /coins/1.json
  def destroy
    @coin.destroy!

    respond_to do |format|
      format.html { redirect_to coins_path, notice: "Coin was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coin_params
      params.require(:coin).permit(:name, :symbol, :current_price, :market_cap, :category_id)
    end
end
