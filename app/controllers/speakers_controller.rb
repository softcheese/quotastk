class SpeakersController < ApplicationController
  def quotes
    @speaker = Speaker.find(params[:id])
  end
end
