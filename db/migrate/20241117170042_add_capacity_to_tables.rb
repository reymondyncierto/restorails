class AddCapacityToTables < ActiveRecord::Migration[8.0]
  def change
    add_column :tables, :capacity, :integer
  end
end
