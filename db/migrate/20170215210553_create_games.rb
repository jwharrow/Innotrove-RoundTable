class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :creator_id, null: false

      t.timestamps(null: false)
    end
  end
end
