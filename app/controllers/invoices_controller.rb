class InvoicesController < ApplicationController
  def index
    @invoices = Order.where(status: "Terminée")
  end

  def show
    @invoice = Order.find(params[:id])
  end
end
