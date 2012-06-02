class AddStopToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :stop, :string
  end
end
