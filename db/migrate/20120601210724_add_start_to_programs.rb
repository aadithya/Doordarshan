class AddStartToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :start, :string
  end
end
