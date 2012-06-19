class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
	add_index :subscriptions, :user_id
    add_index :subscriptions, :tag_id
    add_index :subscriptions, [:user_id, :tag_id], unique: true
  end
end
