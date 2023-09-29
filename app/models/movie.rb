class Movie < ApplicationRecord
  belongs_to :director

  validates :title, :sinopsis, :duration, :premiere, presence: true
end
