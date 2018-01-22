class StocksController < ApplicationController

  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||=Stock.new_from_lookup(params[:stock])
    end
#fix rendering issue
    respond_to do |format|
      format.html
      format.js
    end
  end
end
#-------
  #   else
  #      render status: :not_found, nothing: true
#-------------
  #  if @stock
      #render json: @stock
  #    render partial: 'lookup'
  #  else
  #    render status: :not_found, nothing: true
  #  end
