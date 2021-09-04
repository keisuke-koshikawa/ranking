class OrdersController < ApplicationController
  def index
    @orders = Order.preload(:employee)
  end
end