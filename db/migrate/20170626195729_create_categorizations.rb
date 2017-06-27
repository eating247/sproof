class CreateCategorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :categorizations do |t|
      t.integer :movie_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
    add_index :categorizations, [:genre_id, :movie_id], unique: true
  end
end
