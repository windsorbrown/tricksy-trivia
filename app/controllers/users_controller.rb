class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @user = @current_user
    @games = Game.where(status: 'pending', keep_private: 0)

    recentscores = UserAnswer.created_between(1.day.ago, Time.now)
    @topscores = recentscores.group(:user).sum(:score)

    @win_loss = ActiveRecord::Base.connection.execute %{
      SELECT (
        CASE winner WHEN 't' THEN 'Wins' ELSE 'Losses' END
        ) AS label, count(id) AS Total
      FROM players WHERE user_id = #{@current_user.id} and winner is not null
      GROUP BY winner
      ORDER BY count(id) desc
    }

  end

  def create

  end

end
