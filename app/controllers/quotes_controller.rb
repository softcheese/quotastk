class QuotesController < ApplicationController
  def index
    @quotes = Quote.normal.all
  end
  
  def new
    @quote = Quote.new
  end
  
  def create
    @quote = Quote.create params[:quote]
    @quote.offensive = false if @quote.offensive.nil?
    @quote.spam = false if @quote.spam.nil?
    @quote.save
    redirect_to quotes_path
  end      
end
