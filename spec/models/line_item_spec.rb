require 'rails_helper'

RSpec.describe LineItem, :type => :model do
  let(:line_item) { create(:line_item) }
  describe '.validates' do
    it 'is valid' do
      expect(line_item.valid?).to eq true
    end

    it 'requires a product_id' do
      line_item.product_id = nil
      expect(line_item.valid?).to eq false
    end

    it 'requires a order_id' do
      line_item.order_id = nil
      expect(line_item.valid?).to eq false
    end

    it 'requires a quantity' do
      line_item.quantity = nil
      expect(line_item.valid?).to eq false
    end
  end

  describe '#total' do
    it 'responds to format' do
      expect(line_item.total.format).to eq "$1.00"
    end

    context 'when updating' do
      it "reassigns the total" do
        allow(line_item).to receive(:product).and_return double("Product", price_cents: 1000)
        expect(line_item).to receive(:update_total).and_call_original
        line_item.quantity = 2
        line_item.save
        expect(line_item.total_cents).to eq 2000
      end
    end
  end
end
