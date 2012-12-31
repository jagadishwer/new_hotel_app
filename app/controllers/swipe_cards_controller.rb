class SwipeCardsController < ApplicationController

  def new
    @card=SwipeCard.new()
  end

  def refund
   
        
    @transactions=Transaction.all
    
  end
  def create
    @card=SwipeCard.new(params[:swipe_card])
    if @card.save
      @counter=Counter.find_by_name('main_counter')
      Transaction.create(:counter_id=>@counter,:cost=>params[:swipe_card][:balance].to_f,:swipe_card_id=>@card.id,:type_of_transaction=>1,:balance=>@card.balance)
      redirect_to :action=>'main_counter', :controller=>'counters'
    else
      redirect_to :action=>'new'
    end

  end
  def show

  end
  def recharge
    if request.post?
      @card=SwipeCard.find(session[:card])
      @amount=@card.balance+params[:swipe_card][:balance].to_f
      @counter=Counter.find_by_name('main_counter')
      #render :text=>@amount
      if  @card.update_attributes(:balance=>@amount)
        Transaction.create(:counter_id=>@counter,:cost=>params[:swipe_card][:balance].to_f,:swipe_card_id=>@card.id,:type_of_transaction=>1,:balance=>@card.balance)
        redirect_to :action=>'main_counter', :controller=>'counters'
       
      end
    else
      if !session[:card].nil?
      @card=SwipeCard.new()
      else
        render :text=>"Swipe Your Card First"
      end
    end
  end


  
  def update

  
    @t=Transaction.find(params[:id])

    @c=SwipeCard.find(@t.swipe_card_id)
    @c.balance=@c.balance.to_f+@t.cost.to_f
    @counter=Counter.find_by_name('main_counter')
    if @c.save
      @t.type_of_transaction=1
      @t.save
      Transaction.create(:counter_id=>@counter,:cost=>@t.cost,:swipe_card_id=>@c.id,:type_of_transaction=>1,:balance=>@c.balance)
      redirect_to :action=>'main_counter', :controller=>"counters"
    end
  end
  def card_session
    
     @card=SwipeCard.find_by_card_no(params[:id])
    session['card']=@card.id
     puts "**********************************************"
    puts session['card']
    return

  end
  def card_details
 
 if session['card'].nil?
    @card=SwipeCard.find_by_card_no(params[:id])
    session['card']=@card.id
 else
   @card=SwipeCard.find(session['card'])
 end
   
     render 'card_details', :layout=>false
  end

  def verify
    @card=SwipeCard.find_by_card_no(params[:card][:card_no])
    unless @card.nil?
      if (@card.balance.to_f >= params[:card][:total].to_f)
      @card.balance=@card.balance.to_f-params[:card][:total].to_f
      @card.save
      redirect_to :controller=>'orders',:action=>'create',:id=>@card.id
      else
       render :text=>"no enough balance"

      end
    else
      render :text=>"card not found"
    end

  end
  def cancel
    session['card']=nil
   # @card=session['card']
    render :text=>"Successfully Removed"

    #render 'card_details', :layout=>false
  end

end
