require 'rails_helper'

RSpec.describe 'Merchant show Page' do
  before (:each) do
    @all_merchants = File.read('spec/fixtures/all_merchants_fixtures.json')

    stub_request(:get, "http://localhost:3000/api/v1/merchants").to_return(status: 200, body: @all_merchants, headers: {})
    stub_request(:get, "http://localhost:3000/api/v1/merchants/1/items").to_return(status: 200, body: @merchant1_items, headers: {})

    @merchant1 = @all_merchants[:data].first
    visit merchants_path(@merchant_1)
  end
  describe 'When a user visits merchant show page' do
    it 'can see related items and click on them' do

      expect(page).to have_content("Item Nemo Facere")
      expect(page).to have_content("Item Expedita Aliquamga")
    end
  end
end