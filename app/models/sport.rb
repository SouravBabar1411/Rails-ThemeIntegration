class Sport < ApplicationRecord
  #assosiation's
  has_many :players
  has_many :posts
  has_many :annoucements
  
  #validation
  validates :sport_name, presence: true
  validates :total_player, presence: true
  validates :total_player, numericality: true
  validates :sport_name, uniqueness: true
end
