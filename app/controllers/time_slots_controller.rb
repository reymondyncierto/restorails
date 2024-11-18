# app/controllers/time_slots_controller.rb
class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: [:edit, :update, :destroy]

  def new
    @time_slot = TimeSlot.new
  end

  def create
    @time_slot = TimeSlot.new(time_slot_params)

    # Combine the date and time fields into a datetime object
    date = params[:time_slot][:date]  # Extract the date from params
    time = params[:time_slot][:time]  # Extract the time from params

    if date.present? && time.present?
      # Combine the date and time into a valid datetime string (we expect time in format '12:00 AM to 1:00 AM')
      combined_datetime = "#{date} #{time.split(' to ').first}"

      # Parse the combined datetime into a Time object and assign it to the 'time' field
      @time_slot.time = Time.zone.parse(combined_datetime)
    end

    if @time_slot.save
      flash[:notice] = 'Time slot was successfully created.'
      redirect_to calendar_month_path
    else
      flash.now[:alert] = 'Time slot could not be created.'
      render :new
    end
  end

  def edit
    # Render the time slot form with the existing time slot
    respond_to do |format|
      format.html # If you have HTML response (e.g., for direct access)
      format.js { render partial: 'time_slots/timeslot_form', locals: { time_slot: @time_slot } }
    end
  end

  def update
    if @time_slot.update(time_slot_params)
      render json: { success: true, time_slot: @time_slot }
    else
      render json: { success: false, errors: @time_slot.errors.full_messages }
    end
  end

  def destroy
    if @time_slot.destroy
      render json: { success: true }
    else
      render json: { success: false, errors: @time_slot.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  def time_slot_params
    # Only permit 'time', 'max_tables', and 'max_people'. Don't permit 'date' because it doesn't exist in the model.
    params.require(:time_slot).permit(:max_tables, :max_people, :time)
  end
end
