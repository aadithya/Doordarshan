class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
