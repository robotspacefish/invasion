class Score < ApplicationRecord
  belongs_to :user
  validates :value, presence: true

  scope :highest_score, -> { order('value desc').limit(1) }
end
