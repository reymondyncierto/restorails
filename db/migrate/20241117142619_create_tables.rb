class CreateTables < ActiveRecord::Migration[8.0]
  def change
    create_table :tables do |t|
      t.integer :max_people

      t.timestamps
    end
  end
end
