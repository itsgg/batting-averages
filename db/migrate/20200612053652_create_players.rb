class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :player_id, null: false
      t.timestamps
    end
  end
end
