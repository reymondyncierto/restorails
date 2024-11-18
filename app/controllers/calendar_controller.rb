class CalendarController < ApplicationController
  def index
    @events = Event.all
  end

  def month
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @time_slots = TimeSlot.where(time: @date.beginning_of_month..@date.end_of_month)
  end

  def week
    @date = Date.parse(params.fetch(:date, Date.today).to_s)
  end

  def day
    @date = Date.parse(params.fetch(:date, Date.today).to_s)
  end

  # Assuming you're passing the selected day's time slots to the view
def show
  @date = params[:date] ? Date.parse(params[:date]) : Date.today
  @time_slots = TimeSlot.where(date: @date) # Adjust this query to get the time slots for the given day
  @assigned_time_slots = @time_slots.pluck(:time) # This will give you the list of times that are already assigned for that day
end

def time_slots
  # Extract the date from the params
  date = Date.parse(params[:date])

  # Fetch the time slots for this date
  time_slots = TimeSlot.where('DATE(time) = ?', date)

  # Return the while obkect as JSON
  render json: { time_slots: time_slots }
end

end
