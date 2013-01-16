class ReportsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :class=>false
  def payments_due
    @suppliers=Supplier.all

  end
  def internal_orders
 @internal_orders =  InternalOrder.all
 render :layout=>false
end
end
