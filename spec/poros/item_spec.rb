require 'rails_helper'

RSpec.describe Item do
  let(:data) do
    {
      id: 1,
      attributes: {
        name: 'Sample Item',
        description: 'This is a sample item',
        unit_price: 9.99,
        merchant_id: 2
      }
    }
  end

  subject { described_class.new(data) }

  describe '#initialize' do
    it 'sets the correct attributes' do
      expect(subject.id).to eq(1)
      expect(subject.name).to eq('Sample Item')
      expect(subject.description).to eq('This is a sample item')
      expect(subject.unit_price).to eq(9.99)
      expect(subject.merchant_id).to eq(2)
    end
  end
end