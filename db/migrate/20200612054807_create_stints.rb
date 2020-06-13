class CreateStints < ActiveRecord::Migration[6.0]
  def change
    create_table :stints do |t|
      t.references :player
      t.references :team
      t.string :year_id, null: false
      t.integer :hits, null: false, default: 0
      t.integer :at_bats, null: false, default: 0
      t.timestamps
    end
  end
end
