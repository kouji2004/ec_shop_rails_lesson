class Public::ItemsController < ApplicationController

def index
 @itemes = Item.all
end

end
