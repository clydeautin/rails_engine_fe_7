require 'rails_helper'

RSpec.describe EngineBackendService, type: :service do
  before(:each) do
    @base_url = 'http://localhost:3000/api/v1'
    
    @all_merchants_response = File.read('spec/fixtures/all_merchants_fixtures.json')
    # @one_merchant_response = File.read('spec/fixtures/one_merchant_fixture.json')
    @merchant_items_response = File.read('spec/fixtures/merchant1_items_fixtures.json')
    @all_items_response = File.read('spec/fixtures/all_items_fixtures.json')
    # @one_item_response = File.read('spec/fixtures/one_item_fixture.json')
  end

  describe '.get_all_merchants' do
    it 'returns all merchants' do
      stub_request(:get, "#{@base_url}/merchants").to_return(status: 200, body: @all_merchants_response, headers: {})

      response = EngineBackendService.get_all_merchants

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_an(Array)
      expect(response[:data].first[:attributes][:name]).to eq('Schroeder-Jerde')
    end
  end

  describe '.get_one_merchant' do
    it 'returns one merchant by id' do
      stub_request(:get, "#{@base_url}/merchants/1").to_return(status: 200, body: @all_merchants_response, headers: {})

      response = EngineBackendService.get_one_merchant(1)

      expect(response).to be_a(Hash)
      expect(response[:data].first[:id]).to eq(1)
      expect(response[:data].first[:attributes][:name]).to eq('Schroeder-Jerde')
    end
  end

  describe '.get_merchant_items' do
    it 'returns items for a merchant' do
      stub_request(:get, "#{@base_url}/merchants/1/items").to_return(status: 200, body: @merchant_items_response, headers: {})

      response = EngineBackendService.get_merchant_items(1)

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_an(Array)
      expect(response[:data].first[:attributes][:name]).to eq('Item Nemo Facere')
    end
  end

  describe '.get_all_items' do
    it 'returns all items' do
      stub_request(:get, "#{@base_url}/items").to_return(status: 200, body: @all_items_response, headers: {})

      response = EngineBackendService.get_all_items

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_an(Array)
      expect(response[:data].first[:attributes][:name]).to eq('Item Nemo Facere')
    end
  end

  describe '.get_one_item' do
    it 'returns one item by id' do
      stub_request(:get, "#{@base_url}/items/1").to_return(status: 200, body: @all_items_response, headers: {})

      response = EngineBackendService.get_one_item(1)

      expect(response).to be_a(Hash)
      expect(response[:data].first[:id]).to eq("4")
      expect(response[:data].first[:attributes][:name]).to eq('Item Nemo Facere')
      expect(response[:data].first[:attributes][:description]).to eq("Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
      expect(response[:data].first[:attributes][:unit_price]).to eq(42.91)
      expect(response[:data].first[:attributes][:merchant_id]).to eq(1)
    end
  end
end