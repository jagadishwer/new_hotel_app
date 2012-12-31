class DeliveryItemsController < ApplicationController
  #load_and_authorize_resource
  def new
    #@delivery=DeliveryItem.new()
    @stlis= StockListItem.find(:all)
      @stock_list_items= StockListItem.new()
  end

  def create
    render :text=>"hello"
  end
end
