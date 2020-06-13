class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_id, null: false
      t.string :name, null: false
      t.string :year_id, null: false
      t.timestamps
    end
  end
end
