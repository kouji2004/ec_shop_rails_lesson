class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
    @itemes = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(iteme_params)
    redirect_to root_path
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
