class ProductAddWorker
  include Sidekiq::Worker

  sidekiq_options retry: false , queue: :product_queue
  require 'csv'

  def perform(file)
    csv = CSV.parse(file, :headers => true)
    csv.each do |product|
      Product.create(
          name: product[0],
          price: product[1],
          description: product[2]
      )
    end
  end
end