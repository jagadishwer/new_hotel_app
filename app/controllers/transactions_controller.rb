class TransactionsController < ApplicationController
  def show
    @transactions= Transaction.all

  end
end
