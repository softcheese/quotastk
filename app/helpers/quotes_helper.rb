module QuotesHelper
  def offensive_link(quote)
    if quote.offensive
      link_text = 'Not offensive'
    else
      link_text = 'Offensive'
    end
    link_to link_text, '#'
  end
  
  def spam_link(quote)
    if quote.offensive
      link_text = 'Not spam'
    else
      link_text = 'Spam'
    end
    link_to link_text, '#'
  end
  
  def speakers_list(quote)
    links = quote.speakers.collect do |speaker| 
      link_to speaker.name, quotes_speaker_url(speaker)
    end 
    return links.to_sentence.html_safe
  end
end
