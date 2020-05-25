require 'rails_helper'

RSpec.describe ProductsSerializer do

  let(:product) {FactoryBot.build(:product)}

  describe '#attributes' do
    it 'should render valid fields in json' do
      product = FactoryBot.build(:product)
      expected_keys = [:name, :price, :description]

      product_serializer = ProductsSerializer.new(product)

      expect(product_serializer.serializable_hash.keys).to eq(expected_keys)
      expect(product_serializer.serializable_hash[:name]).to eq(product.name)
      expect(product_serializer.serializable_hash[:price]).to eq(product.price)
      expect(product_serializer.serializable_hash[:description]).to eq(product.description)
    end
  end
end