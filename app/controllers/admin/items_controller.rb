class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
    @itemes = Item.all
  end


  def create
    @item = Item.new(iteme_params)
    @item.save
    redirect_to root_path
  end

  private
  def iteme_params
    params.require(:item).permit(:item_image,:name,:introduction,:genre_id,:price)
  end
end
