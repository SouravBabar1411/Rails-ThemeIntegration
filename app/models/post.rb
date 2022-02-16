class Post < ApplicationRecord
  #image uploader
  mount_uploader :image, FileUploader

  #assosiation's
  has_many :comments
  belongs_to :user
  has_many :hashtags, as: :tagable
  belongs_to :sport
  
  #validation
  validates :PlayerName, :image, :sport, :title, :description, presence: true
  
  #friendly id 
  extend FriendlyId
  friendly_id :title, use: :slugged
end
