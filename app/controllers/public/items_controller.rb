class Public::ItemsController < ApplicationController

def index
 @itemes = Item.all
end

def show
    @item = Item.find(params[:id])
end
end
