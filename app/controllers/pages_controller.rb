class PagesController < ApplicationController

  def index
     recentscores = UserAnswer.created_between(1.day.ago, Time.now)
    @topscores = recentscores.group(:user).sum(:score) 
  end

  def dash
  end

  def join_game
  end

  def static
  end
  
end
