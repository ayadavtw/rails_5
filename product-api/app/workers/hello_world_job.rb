class HelloWorldJob < ApplicationJob
  queue_as :product_queue
  def perform
    puts 'Hello World!'
  end
end