# == Schema Information
#
# Table name: offers
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  business_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Offer < ApplicationRecord
  #Association
  belongs_to :business

  #Validation
  validates :title, :description, :start_date, :end_date, presence: true

  def self.search(search)
    where("business_id  LIKE ?","%#{search}")
  end
end