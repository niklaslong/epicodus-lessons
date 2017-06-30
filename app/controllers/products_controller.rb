class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "product was saved"
      redirect_to products_path
    else
      render :new
    end
  end


private
  def product_params
    params.require(:product).permit(:name, :cost, :country)
  end
end