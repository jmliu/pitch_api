class CreatePitcherGames < ActiveRecord::Migration
  def change
    create_table :pitcher_games do |t|
      t.references :pitcher, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
    add_foreign_key :pitcher_games, :pitchers
    add_foreign_key :pitcher_games, :games
  end
end
