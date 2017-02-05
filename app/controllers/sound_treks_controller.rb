class SoundTreksController < ApplicationController
  def index
  end

  def new
    @sound_trek = SoundTrek.new
  end

  def create

  end
end
