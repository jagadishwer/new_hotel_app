class OrdersController < ApplicationController
#load_and_authorize_resource
def cancel_order
    @order_lists=Orderlist.find(:all,:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
    @order_lists.each do |i|
      i.destroy
    end
    redirect_to :controller => "counters", :action => "counter_items"
  end
 def create
   @card=SwipeCard.find(params[:id])
   @order_lists=Orderlist.find(:all,:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
   @order= Order.new(:status=>0,:counter_id=>session[:counter])
   @sum=0
   @order_lists.each do |ol|
     @order.orderlists<<ol
     @sum+=ol.quantity*ol.price
   end
   @order.total=@sum
   if @order.save
     c=Customer.create(:counter_id=>session[:counter],:total=>@sum,:status=>2)
     c.orders<<@order
     Transaction.create(:counter_id=>session[:counter],:cost=>@sum,:swipe_card_id=>@card.id,:type_of_transaction=>2,:balance=>@card.balance)

   end
    #session[:counter]=nil
  redirect_to :action=>'counter_items',:controller=> 'counters'

 end
  
end
