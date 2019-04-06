class HomeController < ApplicationController
  def index
    @products = Product.all.reverse_order
  end
end
