class InvoicesController < ApplicationController
  def index
    @invoices = Order.where(status: 'Terminée').order(payment_date: :asc)
  end

  def show
    @invoice = Order.find(params[:id])
  end
end
