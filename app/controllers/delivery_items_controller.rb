class DeliveryItemsController < ApplicationController
  #load_and_authorize_resource
  def new
    #@delivery=DeliveryItem.new()
    @stlis= StockListItem.find(:all)
    @stock_list_item= StockListItem.new()
  end
  def create
    @delivery = Delivery.new
    @stock_list_items = StockListItem.all
    @sum=0
    @stock_list_items.each do |s|
      dl=DeliveryItem.create(:stock_list_item_id=>s.id,:mrp=> params[s.name][:mrp],:quantity=>params[s.name][:quantity])
     @delivery.delivery_items<<dl
      @sum+=params[s.name][:mrp].to_f
    end
    @delivery.cost=@sum
    @delivery.save
    render :text=>"Delivery Successfully Saved", :layout=>true
  end
end
