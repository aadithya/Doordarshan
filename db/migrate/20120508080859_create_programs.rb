class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.text :description
      t.string :image
      t.references :category

      t.timestamps
    end
    add_index :programs, :category_id
  end
end
