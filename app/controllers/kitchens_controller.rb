class KitchensController < ApplicationController
  before_filter :kitchen_authorize
  layout 'show' , :except=>['display']
  #authorize_resource :class=>false
  def new
    @kitchen = Kitchen.new
  end
  def create
    @kitchen = Kitchen.new(params[:kitchen])
    if @kitchen.save
      flash[:success]="Kitchen created successfully!"
      redirect_to :controller => 'kitchens', :action => 'display'
    end
  end
  def display
    @kitchens = Kitchen.all
  end
  def edit
    @kitchen = Kitchen.find(params[:id])
  end
  def update
    @kitchen = Kitchen.find(params[:kitchen][:id])
    if @kitchen.update_attributes(params[:kitchen])
      flash[:success]='Kitchen updated successfully!'
      redirect_to :action => 'display'
    else
      render 'new'
    end
  end
  def destroy
    @kitchen = Kitchen.find(params[:id])
    if @kitchen.destroy
      flash[:success]="Kitchen deleted successfully!"
      redirect_to :action => 'display'
    end
  end


  def show
    if session[:kitchen].nil?
      @kitchen = Kitchen.find(params[:kitchen][:kitchen_id])
      session[:kitchen]=params[:kitchen][:kitchen_id]
    else
      @kitchen=Kitchen.find( session[:kitchen])
    end
    @counter=@kitchen.counter
    @orders=@counter.orders.find(:all, :limit => 20,:conditions=>{:status=>0},:order=>'created_at DESC')
    #@orders=@counter.orders
    @orders=@orders.each_slice(10).to_a
  end
  def show_nolayout
    if session[:kitchen].nil?
      @kitchen = Kitchen.find(params[:kitchen][:kitchen_id])
      session[:kitchen]=params[:kitchen][:kitchen_id]
    else
      @kitchen=Kitchen.find( session[:kitchen])
    end
    @counter=@kitchen.counter
    @orders=@counter.orders.find(:all, :limit => 20,:conditions=>{:status=>0},:order=>'created_at DESC')
    #@orders=@counter.orders
    @orders=@orders.each_slice(10).to_a
    render 'show',:layout=>false
  end

  #  def show
  #    if session[:kitchen].nil?
  #    @counter = Counter.find(params[:counter][:counter_id])
  #    session[:kitchen]=params[:counter][:counter_id]
  #    else
  #      @counter=Counter.find( session[:kitchen])
  #    end
  #    @orders=@counter.orders.find(:all, :limit => 20,:conditions=>{:status=>0},:order=>'created_at DESC')
  #    #@orders=@counter.orders
  #    @orders=@orders.each_slice(10).to_a
  #
  #  end
  #  def show_nolayout
  #
  #   if session[:kitchen].nil?
  #    @counter = Counter.find(params[:counter][:counter_id])
  #    session[:kitchen]=params[:counter][:counter_id]
  #    else
  #      @counter=Counter.find( session[:kitchen])
  #    end
  #    @orders=@counter.orders.find(:all, :limit => 20,:conditions=>{:status=>0},:order=>'created_at DESC')
  #    #@orders=@counter.orders
  #    @orders=@orders.each_slice(10).to_a
  #
  #    render 'show',:layout=>false
  #  end
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
    #@counters=Counter.where("name!='main_counter'")
    @kitchens=Kitchen.all
    #authorize! :write, Counter
  end
  def stock
  end
end
