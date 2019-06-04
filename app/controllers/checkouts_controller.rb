class CheckoutsController < ApplicationController
  before_action :set_checkout, only: [:show, :edit, :update, :destroy]

  # GET /checkouts
  # GET /checkouts.json
  def index
    @checkouts = Checkout.all
  end

  # GET /checkouts/1
  # GET /checkouts/1.json
  def show
    @userdata_checkout = UserdataCheckout.new
  end

  # GET /checkouts/new
  def new
    @checkout = Checkout.new
  end

  # GET /checkouts/1/edit
  def edit
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @checkout = Checkout.new(checkout_params)

    @products = []

    params[:products_id].each do |id|
      @product = Product.where(id: id).first
      @products.push @product
      @product.quantity -= 1
      @product.save
    end

    respond_to do |format|
      if @checkout.save

        @products.each do |product|
          @checkout_product = CheckoutProduct.new
          @checkout_product.products_id = product.id
          @checkout_product.checkout_id = @checkout.id

          @checkout_product.save
        end

        format.json { render :show, status: :created, location: @checkout }

      else
        format.html { render :new }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkouts/1
  # PATCH/PUT /checkouts/1.json
  def update
    update_checkout_status(params[:id])    

    respond_to do |format|
      # if @checkout.update(checkout_params)
        # format.html { redirect_to "/my-sal" }
        format.json { render: :show, status: :ok }
      # else
        # format.html { render :edit }
        # format.json { render json: @checkout.errors, status: :unprocessable_entity }
      # end
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout.destroy
    respond_to do |format|
      format.html { redirect_to checkouts_url, notice: 'Checkout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkout_params
      params.require(:checkout).permit(:total_amount, :user_id, :status)
    end

    def update_checkout_status(checkout_id)
      @checkout = Checkout.find(checkout_id)

      case @checkout.status
      when 'REQUESTED'
        @checkout.status = 'CHECKING'
      when 'CHECKING'
        @checkout.status = 'SHIPPED'
      when 'SHIPPED'
        @checkout.status = 'DELIVERED'
      end

      @checkout.save
    end
end
