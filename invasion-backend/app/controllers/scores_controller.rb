class ScoresController < ApplicationController
  def index
    scores = Score.all
    render json: ScoreSerializer.new(scores)
  end

  def leaderboard
    users_and_scores = Score.leaderboard_users_and_scores
    render json: users_and_scores
  end

  def create
    score = Score.create(username: params[:username])
    render json: UserSerializer.new(user)
  end

end
