require 'rails_helper'
require "spec_helper"

RSpec.describe ProductsController do

  describe 'GET #index' do
    context 'when we have 1 or more products' do
      let!(:product) { FactoryBot.create(:product) }

      it 'should return the product info' do
        get :index
        expected = {
            "price"  => product.price,
            "name" => product.name,
            "description" => product.description
        }.to_hash
        expect(response.content_type).to eq('application/json')
        parsed_body = JSON.parse(response.body).first
        expect(parsed_body).to eql(expected)
      end
    end
    context 'when we have no products' do
      it 'should return empty list' do
        get :index
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body).length).to eq(0)
      end
    end
  end

  describe 'GET show/:id' do
    context 'when we have product for given product id' do
      let!(:product) { FactoryBot.create(:product) }

      it 'should return the product info' do
        get :show, params: { id: product.id }
        expected = {
            "price"  => product.price,
            "name" => product.name,
            "description" => product.description
        }.to_hash

        expect(response.content_type).to eq('application/json')
        parsed_body = JSON.parse(response.body)
        expect(parsed_body).to eql(expected)
      end
    end
    context 'when we have no products' do
      it 'should return empty list' do
        id = 1
        get :show, params: { id: id}
        expect(response.status).to eq(404)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)).to eq({"error"=>"Couldn't find Product with 'id'=#{id}"})
      end
    end
  end


  describe 'GET #index' do
    context 'when we have 1 or more products' do
      let!(:product) { FactoryBot.create(:product) }

      it 'should return the product info' do
        get :index
        expected = {
            "price"  => product.price,
            "name" => product.name,
            "description" => product.description
        }.to_hash
        expect(response.content_type).to eq('application/json')
        parsed_body = JSON.parse(response.body).first
        expect(parsed_body).to eql(expected)
      end
    end
    context 'when we have no products' do
      it 'should return empty list' do
        get :index
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body).length).to eq(0)
      end
    end
  end

  describe 'POST #create' do
    context 'when send a valid request' do
      let(:product) { FactoryBot.build(:product) }

      it 'should create a product and return product info' do
        params = {
            "price"  => product.price,
            "name" => product.name,
            "description" => product.description
        }
        p product: params
        post :create, params: { product: params }
        expected = params.to_hash
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
        parsed_body = JSON.parse(response.body)
        expect(parsed_body).to eql(expected)
      end
    end
    context 'when we have no products' do
      it 'should not create a product' do
        post :create, params: { product: {} }
        expect(response.status).to have_received(422)
      end
    end
  end

end