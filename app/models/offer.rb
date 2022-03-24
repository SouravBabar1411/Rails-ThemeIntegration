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
  scope :this_month, -> { where(:start_date => Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :last_month, -> { where(:created_at => 1.months.ago.beginning_of_month..1.months.ago.end_of_month) }
  scope :today, -> {where(:created_at => Time.now.beginning_of_day..Time.now.end_of_day)}

  private

  def cap_name
    self.title = title.downcase.titleize
  end
  
  def demo_msg
    puts 'Its before save callback'
  end
end