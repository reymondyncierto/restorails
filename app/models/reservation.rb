class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :time_slot

  validates :date, presence: true
  validates :number_people, presence: true
  validates :status, presence: true, inclusion: { in: ['confirmed', 'pending', 'canceled'] }
end
