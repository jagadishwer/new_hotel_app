class DeliveryItemsController < ApplicationController
  #load_and_authorize_resource
  def new
    #@delivery=DeliveryItem.new()
    @stlis= StockListItem.find(:all)
    @stock_list_item= StockListItem.new()
  end
  def create
#    #@delivery_item = DeliveryItem.new
#    @stock_list_items = StockListItem.all
#    @stock_list_items.each do |s|
#      params[s.name][:mrp]
#      params[s.name][:quantity]
#    end
#    @di = DeliveryItem.create
#    @d = Delivery.new(@di)
#    @d << @di
#    @d.save
  end
end
