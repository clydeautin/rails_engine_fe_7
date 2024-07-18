class ItemsController < ApplicationController
  def index
    @items = ItemFacade.new.all_items
  end

  def show
    @item = ItemFacade.new.one_item_by_id(params[:item_id])

  end
end