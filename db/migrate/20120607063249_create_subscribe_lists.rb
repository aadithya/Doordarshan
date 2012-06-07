class CreateSubscribeLists < ActiveRecord::Migration
  def change
    create_table :subscribe_lists do |t|
      t.integer :user_id
      t.integer :program_id

      t.timestamps
    end
  end
end
