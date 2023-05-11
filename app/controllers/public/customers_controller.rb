class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新いたしました"
      redirect_to customers_path(@customer)
    else
      render :edit
    end
  end
  
  
  def unsubscribe
    
  end

  def withdrawal
    @customer = current_customer
    #is_deletedカラムをtrueに変更する
    @customer.update(is_valid: false)
    #ログアウトさせる
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  
  
end