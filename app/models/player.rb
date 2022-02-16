class Player < ApplicationRecord
  #image uploader for uploading image
  mount_uploader :image, FileUploader

  #association's
  belongs_to :sport
  belongs_to :user
  
  #validation
  validates :player_name, :image, :player_city, :player_state, :player_country, :phone, :gender, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :phone, length: { is: 10 }
end
