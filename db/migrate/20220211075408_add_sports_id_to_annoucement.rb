class AddSportsIdToAnnoucement < ActiveRecord::Migration[5.2]
  def change
    add_column :annoucements, :sport_id, :integer
    add_index :annoucements, :sport_id
  end
end
