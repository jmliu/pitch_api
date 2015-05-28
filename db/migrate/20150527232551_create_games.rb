class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_id, unique: true, index: true
      t.date :date

      t.timestamps null: false
    end
  end
end
