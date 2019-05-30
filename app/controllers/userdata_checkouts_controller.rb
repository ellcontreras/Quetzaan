class UserdataCheckoutsController < ApplicationController
  before_action :set_userdata_checkout, only: [:show, :edit, :update, :destroy]

  # GET /userdata_checkouts
  # GET /userdata_checkouts.json
  def index
    @userdata_checkouts = UserdataCheckout.all
  end

  # GET /userdata_checkouts/1
  # GET /userdata_checkouts/1.json
  def show
  end

  # GET /userdata_checkouts/new
  def new
    @userdata_checkout = UserdataCheckout.new
  end

  # GET /userdata_checkouts/1/edit
  def edit
  end

  # POST /userdata_checkouts
  # POST /userdata_checkouts.json
  def create
    @userdata_checkout = UserdataCheckout.new(userdata_checkout_params)

    respond_to do |format|
      if @userdata_checkout.save
        format.html { redirect_to @userdata_checkout, notice: 'Userdata checkout was successfully created.' }
        format.json { render :show, status: :created, location: @userdata_checkout }
      else
        format.html { render :new }
        format.json { render json: @userdata_checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userdata_checkouts/1
  # PATCH/PUT /userdata_checkouts/1.json
  def update
    respond_to do |format|
      if @userdata_checkout.update(userdata_checkout_params)
        format.html { redirect_to @userdata_checkout, notice: 'Userdata checkout was successfully updated.' }
        format.json { render :show, status: :ok, location: @userdata_checkout }
      else
        format.html { render :edit }
        format.json { render json: @userdata_checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userdata_checkouts/1
  # DELETE /userdata_checkouts/1.json
  def destroy
    @userdata_checkout.destroy
    respond_to do |format|
      format.html { redirect_to userdata_checkouts_url, notice: 'Userdata checkout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userdata_checkout
      @userdata_checkout = UserdataCheckout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userdata_checkout_params
      params.require(:userdata_checkout).permit(:user_id, :checkout_id, :name, :street, :external_number, :internal_number, :country, :zip_code, :state, :city)
    end
end
