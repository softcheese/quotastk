class Quote < ActiveRecord::Base
  belongs_to :speaker
  
  scope :normal, where(:offensive => false)
  scope :offensive, where(:offensive => true)
  
end
