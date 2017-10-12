class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :position, null: false
      t.string :alignment, default: "villager"
      t.integer :game_id, null: false
      t.string  :role
      t.string :special
      t.boolean  :alive, default: true
      t.timestamps
    end
  end
end
