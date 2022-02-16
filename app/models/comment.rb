class Comment < ApplicationRecord
  #assosiations
  belongs_to :post
  has_many :hashtags, as: :tagable
  belongs_to :user
  
  #validations
  validates :comment, presence: true
end
