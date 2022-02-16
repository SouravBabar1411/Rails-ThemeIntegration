class RemoveColumnPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :player_id, :interger
  end
end
