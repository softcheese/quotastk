class Quote < ActiveRecord::Base
  has_and_belongs_to_many :speakers
  accepts_nested_attributes_for :speakers
  
  scope :normal, where(:offensive => false)
  scope :offensive, where(:offensive => true)
  
  validates_presence_of :body, :on => :create, :message => "can't be blank"
  
  def speaker_list
    speakers.collect{ |s| s.name }.to_sentence
  end
end
