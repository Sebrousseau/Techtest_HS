require 'rails_helper'



RSpec.describe "Orders", type: :request do
    Order.destroy_all
    Product.destroy_all

    product = create(:product)

    let(:valid_attributes) {
    build(:order).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    build(:order_without_customer).attributes.symbolize_keys
  }

  describe "GET /index" do
    it "renders a successful response" do
      Order.create! valid_attributes
      get orders_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Order" do
        expect {
          post orders_url, params: { product: {"#{product.id}"=>'10'}, customer: build(:order) }
        }.to change(Order, :count).by(1)
      end

      it "redirects to the created order" do
        post orders_url, params: { product: {"#{product.id}"=>'10'}, customer: build(:order) }
        expect(response).to redirect_to(order_url(Order.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Order" do
        expect {
          post orders_url, params: { product: {"#{product.id}"=>''} }
        }.to change(Order, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post orders_url, params: { product: {"#{product.id}"=>''}, order: valid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
