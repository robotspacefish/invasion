class User < ApplicationRecord
  has_many :scores
  validates :username, presence: true, uniqueness: true
end
