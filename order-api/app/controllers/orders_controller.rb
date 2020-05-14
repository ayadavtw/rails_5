class OrdersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  def create
    @order= Order.new(order_params)
    @order.user = current_user
    if @order.save
      SignupMailer.signup_email(current_user).deliver
      render json: @order , serializer: OrdersSerializer
    else
      render json: {errors: @order.errors}
    end
  end

  def order_params
    params.require(:order).permit(:product, :price)
  end
end
