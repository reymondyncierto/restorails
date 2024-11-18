class CreateTimeSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :time_slots do |t|
      t.datetime :time
      t.integer :max_tables

      t.timestamps
    end
  end
end
