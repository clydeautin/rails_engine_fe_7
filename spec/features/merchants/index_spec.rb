require 'rails_helper'

RSpec.describe 'Merchants Page' do
  before (:each) do
    @merchant_1 = Merchant.create!(name: 'Target')
    @merchant_2 = Merchant.create!(name: 'Walmart')
    @merchant_3 = Merchant.create!(name: 'Costco')

    visit merchants_path
  end
  describe 'When a user visits merchants index' do
    expect(page).to have_link("#{@merchant_1.name}")
    expect(page).to have_link("#{@merchant_2.name}")
    expect(page).to have_link("#{@merchant_3.name}")
  end
end