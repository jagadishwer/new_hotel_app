class ReportsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :class=>false
  def payments_due
    @suppliers=Supplier.all

  end
end
