class AddColumnsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :bigint
    add_column :users, :sport_id, :integer
  end
end
