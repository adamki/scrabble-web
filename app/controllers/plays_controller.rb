class PlaysController < ApplicationController
  def index
    plays = Play.all
    @plays = plays.sort_by{|play| play.score}.reverse.first(5)
    

  end

  def new
  end

  def create
  end
end
