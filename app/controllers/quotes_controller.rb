class QuotesController < ApplicationController
  def index
    @quotes = Quote.normal.all
  end
  
  def new
    @quote = Quote.new
    @quote.speakers.build
  end
  
  def create
    unsentencize_speaker_names
    @quote = Quote.create params[:quote]
    redirect_to quotes_path
  end
  
  def edit
    @quote = Quote.find(params[:id])
  end
  
private
  
  def unsentenceize_speaker_names
    speaker_names = params[:quote][:speakers_attributes]['0'][:name].sentence_to_array
    speaker_names.each_with_index do |speaker_name, i|
      params[:quote][:speakers_attributes]['0'][:name] = speaker_name if i==0
      params[:quote][:speakers_attributes].store("#{i}", {:name => speaker_name})
      if (speaker = Speaker.find_by_name(speaker_name))
        params[:quote][:speakers_attributes]["#{i}"].store(:id, speaker.id)
      end
    end
  end
  
end
