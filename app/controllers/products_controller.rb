class ProductsController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    puts 'Product', @product

    @product.save
    redirect_to @product
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  private
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price,
      :quantity,
      { product_pictures: [] }
    )
  end
end
