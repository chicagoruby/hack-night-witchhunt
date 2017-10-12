class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_count, null: false
      t.timestamps
    end
  end
end
