require 'rails_helper'

RSpec.describe Product, type: :model do
  context "validation tests" do

    it { should validate_presence_of :name }

    it { should validate_presence_of :price }

    it { should validate_presence_of :description }

    it { should validate_numericality_of :price }

    it 'should save successfully' do
      product  = Product.new(name: "Fridge", price: 10000, description: "double door Fridge")
      assert product.save
    end
  end

  context "scope test" do

  end
end
