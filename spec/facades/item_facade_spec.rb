require "rails_helper"

RSpec.describe ItemFacade do
    before(:each) do
      @base_url = 'http://localhost:3000/api/v1'
      @all_items_response = File.read('spec/fixtures/all_items_fixtures.json')
      @one_item_response = File.read('spec/fixtures/one_item_fixture.json')
    end

    describe "#all_items" do
      it "returns a full list of item objects" do
        stub_request(:get, "#{@base_url}/items").to_return(status: 200, body: @all_items_response, headers: {})
        
        facade = ItemFacade.new
        response = facade.all_items
        
        expect(response).to be_an(Array)
      end

      it "returns one item by id" do
        stub_request(:get, "#{@base_url}/items/1").to_return(status: 200, body: @one_item_response, headers: {})
        
        facade = ItemFacade.new
        item = facade.one_item_by_id(4)
        
        expect(item).to be_a(Item)
      end
    end
end