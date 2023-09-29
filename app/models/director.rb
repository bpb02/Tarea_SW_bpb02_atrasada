class Director < ApplicationRecord
    has_many :movies, dependent: :destroy
    has_many :rankings, dependent: :destroy
  
    validates :name, :age, :country, presence: true
    validates :name, uniqueness: true
  end
  