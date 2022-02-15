class OrderProductsController < ApplicationController

  def new
    @order_product = OrderProduct.new
  end

  private

  def order_product_params
    params.require(:order_product).permit(:total_ht, :total_ttc, :quantity, :order_id)
  end
end
