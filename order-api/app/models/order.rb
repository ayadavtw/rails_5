class Order < ApplicationRecord
  #TODO after/before [:create, :save :update] - send emails callbacks ?
  belongs_to :user
end
