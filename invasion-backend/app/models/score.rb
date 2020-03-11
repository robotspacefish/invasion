class Score < ApplicationRecord
  belongs_to :user
  validates :value, presence: true

  scope :highest_score, -> { order('value desc').limit(1) }
  scope :leaderboard, -> { order('value desc').limit(10) }
  scope :order_all_desc, -> { order('value desc') }
  scope :order_all_asc, -> { order(:value) }

  def self.leaderboard_users_and_scores
    high_scores = Score.leaderboard
    high_scores.collect do |score|
      {
        value: score.value,
        username: User.find_by(id: score.user_id).username
      }
    end
  end
end
