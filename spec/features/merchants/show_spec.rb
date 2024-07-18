require 'rails_helper'

RSpec.describe 'Merchant show Page' do
  before (:each) do
    @all_merchants = File.read('spec/fixtures/all_merchants_fixtures.json')
    json = JSON.parse(@all_merchants, symbolize_names: true)
    @merchant1 = json[:data].first
    @merchant1_items = File.read('spec/fixtures/merchant1_items_fixtures.json')


    stub_request(:get, "http://localhost:3000/api/v1/merchants").to_return(status: 200, body: @all_merchants, headers: {})
    stub_request(:get, "http://localhost:3000/api/v1/merchants/1/items").to_return(status: 200, body: @merchant1_items, headers: {})

    visit "merchants/#{@merchant1[:id]}"

  end

  describe 'When a user visits merchant show page' do
    it 'can see related items and click on them' do

      expect(page).to have_content("Item Nemo Facere")
      expect(page).to have_content("Item Expedita Aliquam")
    end
  end
end