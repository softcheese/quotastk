require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  
  def setup
    quotes.each do |quote|
      Quote.create quote
    end  
  end

  test "should not return any offensive quotes" do    
    Quote.normal.each do |quote|
      assert !quote.offensive
    end
  end
  
  test "should not return any normal quotes" do
    Quote.offensive.each do |quote|
      assert quote.offensive
    end
  end
end
