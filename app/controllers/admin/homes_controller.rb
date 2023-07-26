class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @orders = Order.all
    @customers = Customer.page(params[:page]).per(15)
  end
  
end
