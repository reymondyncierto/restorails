module ApplicationHelper
  def month_offset(date)
    date.beginning_of_month.wday
  end

  def today?(date)
    date == Date.today
  end

  def today_class(day)
    'bg-info' if day == Date.today
  end

  # Return the start of the week for a given date
  def start_of_week(date)
    date.beginning_of_week - 1.day
  end

  # Return the end of the week for a given date
  def end_of_week(date)
    date.end_of_week - 1.day
  end

  def time_slots_with_duration
    (0..23).map do |hour|

      start_hour = (hour % 12 == 0) ? 12 : (hour % 12)
      start_period = hour < 12 ? 'AM' : 'PM'

      end_hour = ((hour + 1) % 12 == 0) ? 12 : ((hour + 1) % 12)
      end_period = (hour + 1) < 12 ? start_period : (start_period == 'AM' ? 'PM' : 'AM')

      "#{start_hour}:00 #{start_period} to #{end_hour}:00 #{end_period}"
    end
  end

end
