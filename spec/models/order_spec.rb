require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'create order' do
    Order.destroy_all

    it 'should increment order count' do
      create(:order)
      expect(Order.count).to eq(1)
    end

    it 'should not create order if there is no customer' do
      order = build(:order_without_customer)
      expect(order.valid?).to be false
    end
  end
end
