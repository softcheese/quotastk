String.module_eval do
  def sentence_to_array
    return self.gsub(/\sand\s/i, ', ').split(', ')
  end
end