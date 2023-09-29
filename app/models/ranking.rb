class Ranking < ApplicationRecord
  belongs_to :director

  validates :page, :min_score, :score, :max_score, presence: true
end
