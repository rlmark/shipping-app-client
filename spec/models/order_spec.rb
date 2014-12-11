require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) { create(:order) }
  before do
    allow_any_instance_of(Order).to receive(:create_number).and_return(1234, 4567)
  end

  describe '.validates' do
    it 'cant have a duplicate number' do
      create(:order)
      order.number = "1234"
      expect(order.valid?).to eq false
    end
  end

  describe '#number' do

    it 'inits on init' do
      expect(order.number).to eq 1234
    end

    it 'doesnt assign the same number twice' do
      create(:order)
      expect(order.number).to eq 4567
    end
  end
end
