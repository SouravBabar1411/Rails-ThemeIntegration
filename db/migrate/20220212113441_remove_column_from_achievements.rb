class RemoveColumnFromAchievements < ActiveRecord::Migration[5.2]
  def change
    remove_column :achievements, :user_id, :integer
  end
end
