class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
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
      redirect_to mypage_path
    else
      render :edit
    end
  end
  
  def unsubscribe
    
  end

  def withdrawal
    @customer = current_customer
    #is_deletedカラムをtrueに変更する
    @customer.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
  
end