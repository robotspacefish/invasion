class Score < ApplicationRecord
  belongs_to :user
  validates :value, presence: true
end
