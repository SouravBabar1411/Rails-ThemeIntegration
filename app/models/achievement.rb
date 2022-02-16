class Achievement < ApplicationRecord
  #assosiation
  belongs_to :user

  #validation
  validates :award, presence: true
end
