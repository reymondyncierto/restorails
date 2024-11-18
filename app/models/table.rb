class Table < ApplicationRecord
  belongs_to :time_slot

  validates :max_people, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
