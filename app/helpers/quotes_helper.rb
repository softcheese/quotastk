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
end
