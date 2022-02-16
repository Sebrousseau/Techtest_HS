class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_order, only: [:show, :edit, :update, :update_status]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @order_product = OrderProduct.new
    @products = Product.all
  end

  def create
    return if params[:product].values.reject(&:blank?) == []
    @order = Order.create(customer: params[:customer])
    params[:product].each do |product|
      create_order_products(@order, product)
    end
    @order.apply_tva = params[:apply_tva] == 'true'
    @order.total_ht = calcul_total_ht(@order)
    @order.total_ttc = calcul_total_ttc(@order)
    if @order.save
      redirect_to order_path(@order)
    else
      byebug
      render :new
    end
  end

  def edit
    @products = Product.all
  end

  def update
    @order.update(order_params)
    products = params[:product]
    products.each do |product|
      order_product = OrderProduct.where('order_id=? AND product_id=?', @order.id, product[0])
      if order_product.empty?
        create_order_products(@order, product)
      else
        order_product.update(
          quantity: product[1],
          total_price_ht: Product.find(product[0]).unit_price_ht * product[1].to_i,
          total_price_ttc: with_tva(Product.find(product[0])) * product[1].to_i
        )
      end
    end
    @order.apply_tva = params[:apply_tva] == 'true'
    @order.total_ht = calcul_total_ht(@order)
    @order.total_ttc = calcul_total_ttc(@order)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def update_status
    order = status_order_params
    @order.payment_date = Time.now if order[:status] == 'Terminée'
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
    params.permit(:customer, :total_ht, :total_ttc, :status, :apply_tva)
  end

  def status_order_params
    params.require(:order).permit(:customer, :total_ht, :total_ttc, :status, :apply_tva)
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def with_tva(product)
    product.unit_price_ht + product.unit_price_ht * product.tva
  end

  def create_order_products(order, product)
    if product[1] != '' && product[1].to_i > 0
      OrderProduct.create(
        order: order,
        product: Product.find(product[0]),
        quantity: product[1].to_i,
        total_price_ht: Product.find(product[0]).unit_price_ht * product[1].to_i,
        total_price_ttc: with_tva(Product.find(product[0])) * product[1].to_i
      )
    end
  end

  def calcul_total_ht(order)
    sum = 0
    order.order_products.each { |op| sum += op.total_price_ht }
    sum
  end

  def calcul_total_ttc(order)
    sum = 0
    order.order_products.each { |op| sum += op.total_price_ttc }
    sum.round(2)
  end
end
