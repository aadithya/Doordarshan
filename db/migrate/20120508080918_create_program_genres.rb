class CreateProgramGenres < ActiveRecord::Migration
  def change
    create_table :program_genres do |t|
      t.references :program
      t.references :genre

      t.timestamps
    end
    add_index :program_genres, :program_id
    add_index :program_genres, :genre_id
  end
end
