class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :program
      t.references :channel
      t.integer :start
      t.integer :end
      t.date :premiere
      t.date :finale
      t.string :recurrence

      t.timestamps
    end
    add_index :schedules, :program_id
    add_index :schedules, :channel_id
  end
end
