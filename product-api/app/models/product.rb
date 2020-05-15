#TODOD: ERRO MESSAGES should support localtization
class Product < ApplicationRecord
  has_one_attached :avatar

  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :description
  validates_numericality_of :price
end
