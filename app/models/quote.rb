class Quote < ActiveRecord::Base
  belongs_to :speaker
  accepts_nested_attributes_for :speaker
  
  scope :normal, where(:offensive => false)
  scope :offensive, where(:offensive => true)
  
  validates_presence_of :body, :on => :create, :message => "can't be blank"
  
end
