class Public::HomesController < ApplicationController
  def top
    @itemes = Item.all
  end
end
