class KitchensController < ApplicationController
  layout 'show'
  def show
    if session[:kitchen].nil?
    @counter = Counter.find(params[:counter][:counter_id])
    session[:kitchen]=params[:counter][:counter_id]
    else
      @counter=Counter.find( session[:kitchen])
    end
    @orders=@counter.orders.find(:all, :limit => 20,:conditions=>{:status=>0},:order=>'created_at DESC')
    #@orders=@counter.orders
    @orders=@orders.each_slice(10).to_a

  end
  def show_nolayout

   if session[:kitchen].nil?
    @counter = Counter.find(params[:counter][:counter_id])
    session[:kitchen]=params[:counter][:counter_id]
    else
      @counter=Counter.find( session[:kitchen])
    end
    @orders=@counter.orders.find(:all, :limit => 20,:conditions=>{:status=>0},:order=>'created_at DESC')
    #@orders=@counter.orders
    @orders=@orders.each_slice(10).to_a

    render 'show',:layout=>false
  end
  def delivered
    puts "================================"
    p params.inspect
    puts "================================"
    @order=Order.find(params[:id])
    @order.status=1
    @order.save
    # redirect_to :action=>"show"
  end
  def kitchen
    session[:kitchen]=nil
  end
end
