class CreateRevisions < ActiveRecord::Migration[5.0]
  def change
    create_table :revisions do |t|
      t.references :game
      t.string :name, null: false
      t.text :description, null: false
      t.integer :collaborator_id

      t.timestamps(null: false)
    end
  end
end
