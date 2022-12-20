class Public::ItemsController < ApplicationController

def index
 @itemes = Item.all
end

def show
    @item = Item.find_by(id: params[:id])
    @cart_item =CartItem.new
end

private

 def item_params
  params.require(:items).permit(:genre_id, :name, :introduction, :item_image, :price)
 end

end
