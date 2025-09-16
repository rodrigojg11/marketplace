class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]

  def index
    @products = Product.all
    render json: serialized(@products, ProductSerializer), status: 200
  end

  def show
    @product = Product.find(params[:id])
    render json: serialized(@product, ProductSerializer), status: 200
  end

  def create
    @product = current_user.products.build(product_params)
      if @product.save
        render json: serialized(@product, ProductSerializer), status: :created
      else
        render json: @product.errors.full_messages
      end
  end

  def update
    if @product = Product.update(product_params)
      render json: serialized(@product, ProductSerializer), status: 204
    else
      render json: @product.error.full_message
    end
  end

  def destroy
    @product = Product.destroy
    render json: @product, status: 303
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :published)
  end
end
