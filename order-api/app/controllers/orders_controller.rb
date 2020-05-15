class OrdersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  def create
    product =  HTTParty.get("http://localhost:30001/products/#{order_params[:product]}")
    @order= Order.new(order_params)
    @order.user = current_user
    @order.price = ActiveSupport::JSON.decode(product.body)["price"]
    if @order.save
      render json: @order , serializer: OrdersSerializer
    else
      render json: {errors: @order.errors}
    end
  end

  def order_params
    params.require(:order).permit(:product)
  end
end
