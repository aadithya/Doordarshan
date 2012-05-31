class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.string :date
      t.string :category
      t.string :channel

      t.timestamps
    end
  end
end
