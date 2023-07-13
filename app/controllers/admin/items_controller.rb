class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新規登録をしました"
      redirect_to admin_items_path
    else
      render :index
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :image)
  end
  
  
  
end