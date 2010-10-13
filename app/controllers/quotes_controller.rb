class QuotesController < ApplicationController
  def index
    @quotes = Quote.normal.all
  end
  
  def new
    @quote = Quote.new
  end
  
  def create
    @quote = Quote.create params[:quote]
    redirect_to quotes_path
  end      
end
