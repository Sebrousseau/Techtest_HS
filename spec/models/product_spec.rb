require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'create product' do
    product = create(:product)

    it 'should increment product count' do
      expect(Product.count).to eq(1)
    end

    it 'product should have a name' do
      expect(product.name).to match(/./)
    end
  end
end
