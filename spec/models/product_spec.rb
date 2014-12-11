require 'rails_helper'

RSpec.describe Product, :type => :model do
  let(:product) { create(:product) }
  describe '.validates' do
    it 'is valid' do
      expect(product.valid?).to eq true
    end

    it 'requires a weight' do
      product.weight = nil
      expect(product.valid?).to eq false
    end

    it 'weight must be greater than 0' do
      product.weight = -1
      expect(product.valid?).to eq false
    end

    it 'requires a name' do
      product.name = nil
      expect(product.valid?).to eq false
    end

    it 'requires a price_cents' do
      product.price_cents = nil
      expect(product.valid?).to eq false
    end

    it 'price_cents must be above 0' do
      product.price_cents = -1
      expect(product.valid?).to eq false
    end
  end

  describe '#weight' do
    it 'has only hundreths place' do
      product.update(weight: 1.3333333)
      product.reload
      expect(product.weight).to eq 1.33
    end
  end

  describe '#price' do
    it 'is responds to format' do
      expect(product.price.format).to eq "$1.00"
    end
  end
end
