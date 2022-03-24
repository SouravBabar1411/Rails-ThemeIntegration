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
  before_validation :cap_name
  before_save :demo_msg
  audited
  #Association
  belongs_to :business

  #Validation
  validates :title, presence: true
  
  scope :with_long_title, -> { where("LENGTH(title) > 6") }

  private

  def cap_name
    self.title = title.downcase.titleize
  end
  
  def demo_msg
    puts 'Its before save callback'
  end
end