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
  
  test "should not save without a body" do
    q = Quote.new
    assert !q.save
  end
  
  test "should return a list of speakers" do
    q = quotes(:with_speakers)
    assert_equal "Blue Sushi, Charlie, and Lauren", q.speaker_list
  end
  
  test "should only return quotes from a particular speaker name" do
    speaker_name = "Charlie"
    quotes = Quote.find_all_by_speaker_name(speaker_name)
    speaker = Speaker.find_by_name(speaker_name)
    quotes.each do |quote|
      assert quote.speaker_ids.include? speaker.id
    end
  end
end
