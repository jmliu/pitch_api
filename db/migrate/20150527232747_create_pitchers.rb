class CreatePitchers < ActiveRecord::Migration
  def change
    create_table :pitchers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :mlb_id, unique: true, index: true
      t.string :throws

      t.timestamps null: false
    end
  end
end
