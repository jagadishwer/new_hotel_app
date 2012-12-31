class CountersController < ApplicationController
  layout 'show'
  def new
    @counter= Counter.new
  end

  def create
    @counter= Counter.new(params[:counter])
    if @counter.save
      redirect_to :action=>'show'
    else
       redirect_to :action=>'show'
    end
  end

  def edit
    @counter=Counter.find(params[:id])
  end

  def show
    @counters=Counter.find(:all, :conditions=>"name!='main_counter'")
  end
  def update
    @counter = Counter.find(params[:counter][:id])
    @counter.update_attributes(params[:counter])
    redirect_to :action=>'show'
  end
  def main_counter

  end
  def other_counter
    session[:counter]=nil
  end

  
  def counter_items
    if session[:counter].nil?
    @counter = Counter.find_by_id(params[:counter][:counter_id])
    session[:counter]=params[:counter][:counter_id]
    else
      @counter=Counter.find_by_id(session[:counter])
    end
    @items = @counter.items
  
render 'order_counter'
  end
  def final_order
    #render :text=>"ok"
     @order_lists=Orderlist.find(:all,:conditions=>{:counter_id=>session[:counter],:order_id=>nil})
     render :layout => false
  end
  def confirm_order
    @card=SwipeCard.new()
    @total=params[:total]

  end
  
  

end
