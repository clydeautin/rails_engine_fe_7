require 'rails_helper'

RSpec.describe MerchantFacade do
  before(:each) do
    @base_url = 'http://localhost:3000/api/v1'
    
    @all_merchants_response = File.read('spec/fixtures/all_merchants_fixtures.json')
    # @one_merchant_response = File.read('spec/fixtures/one_merchant_fixture.json')
    @merchant_items_response = File.read('spec/fixtures/merchant1_items_fixtures.json')
    @merchant1_response = File.read('spec/fixtures/one_merchant_fixture.json')
    @all_items_response = File.read('spec/fixtures/all_items_fixtures.json')
    # @one_item_response = File.read('spec/fixtures/one_item_fixture.json')
  end

  describe "#get_all_merchants" do
    it "returns a full list of merchant objects" do
      stub_request(:get, "#{@base_url}/merchants").to_return(status: 200, body: @all_merchants_response, headers: {})
      
      facade = MerchantFacade.new
      response = facade.all_merchants
      
      expect(response).to be_an(Array)
    end
  end
  
  describe '#one_merchant_by_id' do
  it 'returns a Merchant object' do
      stub_request(:get, "#{@base_url}/merchants/1").to_return(status: 200, body: @merchant1_response, headers: {})
      facade = MerchantFacade.new
      # require 'pry'; binding.pry
      merchant = facade.one_merchant_by_id(1)

      expect(merchant).to be_a(Merchant)
    end
  end

  describe '#merchant_items' do
    it 'returns an array of Item objects' do
      stub_request(:get, "#{@base_url}/merchants/1/items").to_return(status: 200, body: @merchant_items_response, headers: {})

      facade = MerchantFacade.new
      merchant_id = 1
      items = facade.merchant_items(merchant_id)

      expect(items).to be_an(Array)
      expect(items.all? { |item| item.is_a?(Item) }).to be true
    end
  end
end