class OrdersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  def create
    @order= Order.new(order_params)
    port = ENV.fetch("PRODUCT_PORT")
    product =  HTTParty.get("http://localhost:#{port}/products/#{order_params[:product]}")
    @order.price = ActiveSupport::JSON.decode(product.body)["price"]

    @order.user = current_user
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
