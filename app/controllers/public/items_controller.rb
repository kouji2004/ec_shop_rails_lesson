class Public::ItemsController < ApplicationController

def index
 @itemes = Item.all
end

def show
    @item = Item.find_by(id: params[:id])
end
end
