#TODO: how to test serializer
class OrdersSerializer < ApplicationSerializer
  attributes :product, :price, :user
end
