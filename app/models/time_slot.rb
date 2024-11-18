# app/models/time_slot.rb
class TimeSlot < ApplicationRecord

  validates :time, presence: true
  validates :max_tables, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :max_people, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
