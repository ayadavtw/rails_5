class OrdersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  def create
    @order= Order.new(order_params)
    port = ENV.fetch("PRODUCT_PORT")
    headers = {DistributedTracing::TRACE_ID => DistributedTracing.trace_id}
    logger.info("==========>#{@order.product.class}")
    product =  HTTParty.get("http://172.13.1.3:3000/api/v1/products/1", :headers => headers)
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
