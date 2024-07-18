require 'rails_helper'
# require_relative '../app/poros/merchant' 

RSpec.describe Merchant do
  let(:data) { { name: 'Example Merchant', id: 1 } }
  let(:attributes_data) { { attributes: { name: 'Example Merchant' }, id: 1 } }

  describe '#initialize' do
    context 'when data includes :name and :id' do
      it 'sets the name and id attributes correctly' do
        merchant = Merchant.new(data)
        expect(merchant.name).to eq('Example Merchant')
        expect(merchant.id).to eq(1)
      end
    end

    context 'when data includes :attributes with :name and :id' do
      it 'sets the name and id attributes correctly' do
        merchant = Merchant.new(attributes_data)
        expect(merchant.name).to eq('Example Merchant')
        expect(merchant.id).to eq(1)
      end
    end
  end
end