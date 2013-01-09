class DeliveryItemsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def new
    #@delivery=DeliveryItem.new()
    @stlis= StockListItem.find(:all)
    @stock_list_item= StockListItem.new()
    @suppliers=Supplier.all
  end
  def create
    @delivery = Delivery.new
    @stock_list_items = StockListItem.all
    @sum=0
    @stock_list_items.each do |s|
      dl=DeliveryItem.new(:stock_list_item_id=>s.id,:mrp=> params[s.name][:mrp],:quantity=>params[s.name][:quantity],:supplier_id=>params[s.name][:supplier_id],:user_id=>current_user.id)
     if dl.save
      @delivery.delivery_items<<dl
      @sum+=params[s.name][:mrp].to_f
     end
    end
    @delivery.cost=@sum
    @delivery.save
    render :text=>"Delivery Successfully Saved", :layout=>true
  end
end
