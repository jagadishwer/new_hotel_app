class OrderlistsController < ApplicationController
 def new
   
  @orderlist=Orderlist.new()
  @id=params[:id]
  @price=params[:price]
 end
 def create
# @order=Orderlist.new(:counter_id=>session[:counter],:item_id=>params[:orderlist][:id],:quantity=>params[:orderlist][:quantity],:price=>params[:orderlist][:price])
 @order=Orderlist.find_by_item_id(params[:id],:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
   if @order.nil?
   @order=Orderlist.create(:counter_id=>session[:counter],:item_id=>params[:id],:quantity=>params[:quantity],:price=>params[:price])
   else
     @order.update_attributes(:quantity=>@order.quantity+params[:quantity].to_i)
   end
   redirect_to :controller=>'counters', :action=>'final_order'
  # if @order.save
   
   #redirect_to :action=>:counter_items,:controller=>:counters
 #else
 #end
 end







# load_and_authorize_resource
def cancelrequest

puts"=================="
puts params.inspect
    c=Customer.find_by_table_id(params[:table_id],:conditions=>{:status=>0})
    puts c.inspect
    c.orders.where(:status=>0).each do |o|
      i= o.orderlists.find(:first,:conditions=>{:item_id=>params[:item_id],:quantity=>params[:quantity]})
      if !i.nil?
        i.update_attributes(:cancel_item=>true)
        puts i
        break
      end
    end
    respond_to do|format|

          format.html
          format.json {render :json=> true}
          format.xml{render :xml=>true}
       
          
    end
  end

  def destroy

    ol=Orderlist.find(params[:id])
    ord=Order.find(ol.order_id)
    ord.total-=ol.price+(ol.price*User.find(1).tax)/100
    ord.save
    ol.destroy
    redirect_to :controller=>:hotelsessions, :action=>:show
  end
  def cancel
    ol=Orderlist.find(params[:id])
       ol.destroy

    redirect_to :controller=>'counters', :action=>'final_order'
  end
end
