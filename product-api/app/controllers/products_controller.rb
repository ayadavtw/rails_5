#TODO: how to write test for controller
class ProductsController < ApplicationController

  def show
    logger.debug "Showing products############@@@@@@@@@@@@!!!"
    render json: Product.find(params[:id]), serializer:ProductsSerializer
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, :status => :not_found
  end

  def create
    @product= Product.new(product_params)
    if @product.save
      render json: @product , serializer: ProductsSerializer
    else
      render json: {errors: @product.errors}
    end
  end

  def index
    render json: Product.all , each_serializer:ProductsSerializer
  end

  def avatar
    @product = Product.find_by(id: params[:id])
    if @product&.avatar&.attached?
      redirect_to rails_blob_url(@product.avatar)
    else
      head :not_found
    end
  end

  #TODO : strong params and nested attributes
  def product_params
    params.require(:product).permit(:name, :price, :description, :avatar)
  end


end
