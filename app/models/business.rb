# == Schema Information
#
# Table name: businesses
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Business < ApplicationRecord

  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |business|
        csv << business.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      business_hash = row.to_hash
      business = find_or_create_by!(name: business_hash['name'], 
                                    address: business_hash['address'],
                                    start_date: business_hash['start_date'],
                                    end_date: business_hash['end_date'])
      business.update_attributes(business_hash)
    end
  end

  #Validation
  validates :name, :address, :start_date, :end_date, presence: true
end
