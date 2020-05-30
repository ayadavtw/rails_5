#TODOD: ERRO MESSAGES should support localtization
class Product < ApplicationRecord
  require 'activerecord-import/base'
  require 'activerecord-import/active_record/adapters/postgresql_adapter'
  require 'csv'
  has_one_attached :avatar

  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :description
  validates_numericality_of :price

  def self.import(file)
    file.read
    csv = CSV.parse(file, :headers => true)
    csv.each do |product|
      product.create(
          name: product[0],
          price: product[1],
          description: product[2]
      )
    end
  end
end
