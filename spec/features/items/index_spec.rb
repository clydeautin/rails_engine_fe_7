require 'rails_helper'

RSpec.describe 'Item Index Page' do
  before(:each) do
    @all_items = File.read('spec/fixtures/all_items_fixtures.json')
    json = JSON.parse(@all_items, symbolize_names: true)

    stub_request(:get, "http://localhost:3000/api/v1/items").to_return(status: 200, body: @all_items, headers: {})
    
    @nemo_facere = json[:data].first
    visit items_path
  end

  describe 'When a user visits the items index' do
    it ' can show item details once you click on the item' do
      expect(page).to have_content("Item Nemo Facere")
      click_link("Item Nemo Facere")

      expect(current_path).to eq("/items/#{(@nemo_facere[:id])}")

      expect(page).to have_content("Name: Item Nemo Facere")
      expect(page).to have_content("Description: Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
      expect(page).to have_content("Unit price: 42.91")
    end
  end
end