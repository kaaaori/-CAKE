class Public::ItemsController < ApplicationController
  
  def index
    @genres = Genre.all
    if params[:genre]
      @genre = Genre.find(params[:genre])
      @items = @genre.items
    else
      @items = Item.all
    end
  end
  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
    def genre_params
      params.require(:genre).permit(:name)
    end

  
end
