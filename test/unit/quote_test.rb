require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  
  def setup
    quotes.each do |quote|
      Quote.create quote
    end  
  end

  test "should not return any offensive quotes" do    
    found_offensive_quote = false    
    Quote.normal.each do |quote|
      found_offensive_quote = true if quote.offensive == true
    end
    assert !found_offensive_quote
  end
  
  test "should not return any normal quotes" do
    found_normal_quote = false
    Quote.offensive.each do |quote|
      found_normal_quote = true if quote.offensive == false
    end
    assert !found_normal_quote
  end
end
