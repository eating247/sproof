class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :storyline
      t.date :release
      t.string :link
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
