class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update]
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @order_product = OrderProduct.new
    @products = Product.all
  end

  def create
    order = order_params
    @order = Order.new(order)

    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit
    @products = Product.all

  end

  def update
    order = order_params
    if @order.update(order)
      redirect_to orders_path
    else
      render :new
    end
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer, :total_ht, :total_ttc, :status)
  end



  def find_order
    @order = Order.find(params[:id])
  end
end
