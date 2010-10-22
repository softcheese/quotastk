class Quote < ActiveRecord::Base
  has_and_belongs_to_many :speakers, :order => "name ASC"
  accepts_nested_attributes_for :speakers
  
  scope :normal, where(:offensive => false)
  scope :offensive, where(:offensive => true)
  
  validates_presence_of :body, :on => :create, :message => "can't be blank"
  
  def speaker_list
    speakers.collect{ |speaker| speaker.name }.to_sentence
  end
  
  def self.find_all_by_speaker_name(speaker_name)
    Speaker.find_by_name(speaker_name).quotes
  end

end
