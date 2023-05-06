class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_end_user
  end

end
