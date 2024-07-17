require 'rails_helper'

RSpec.describe 'Merchants Page' do
  before (:each) do
    @all_merchants = File.read('spec/fixtures/all_merchants_fixtures.json')

    stub_request(:get, "http://localhost:3000/api/v1/merchants").to_return(status: 200, body: @all_merchants, headers: {})

    visit merchants_path
  end
  describe 'When a user visits merchants index' do
    it 'can see merchant links brought in from API' do
      expect(page).to have_link("Schroeder-Jerde")
      expect(page).to have_link("Klein, Rempel and Jones")
    end
  end
end