class ScoresController < ApplicationController
  def index
    scores = Score.all
    render json: ScoreSerializer.new(scores)
  end

  def leaderboard
    high_scores = Score.leaderboard
    users_and_scores = high_scores.collect do |score|
      {
        value: score.value,
        username: User.find_by(id: score.user_id).username
      }
    end

    render json: users_and_scores
  end
end
