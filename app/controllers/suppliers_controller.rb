class SuppliersController < ApplicationController
  def new
    @supplier=Supplier.new
  end
  def create
    @supplier=Supplier.create(params[:supplier])
  end

  def show

  end

  def edit
      @supplier=Supplier.find(params[:id])
  end
  def update
    @supplier=Supplier.find(params[:id])
    @supplier.update_attributes(params[:supplier])

  end
end
