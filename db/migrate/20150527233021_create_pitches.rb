class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.float :speed
      t.string :pitch_type
      t.boolean :swing
      t.float :horizontal_movement
      t.float :vertical_movement
      t.float :spin_rate
      t.references :pitcher, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
    add_foreign_key :pitches, :pitchers
    add_foreign_key :pitches, :games
  end
end
