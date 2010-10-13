class QuotesController < ApplicationController
  def index
    @quotes = Quote.normal.all
  end
end
