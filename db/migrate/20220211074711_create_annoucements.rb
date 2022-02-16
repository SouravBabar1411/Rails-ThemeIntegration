class CreateAnnoucements < ActiveRecord::Migration[5.2]
  def change
    create_table :annoucements do |t|
      t.text :message
      t.string :game

      t.timestamps
    end
  end
end
