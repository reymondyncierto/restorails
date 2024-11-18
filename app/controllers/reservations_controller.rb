class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = Current.user # Set the current user

    # Parse the combined datetime string and set it on the reservation's date
    if params[:reservation][:combined_datetime].present?
      @reservation.date = DateTime.parse(params[:reservation][:combined_datetime])
    end

    if @reservation.save
      # Handle success
      alert = 'Reservation was successfully created.'
     
    else
      # Handle errors
      respond_to do |format|
        format.html { render :new }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('reservation_form', partial: 'reservations/form', locals: { reservation: @reservation }) }
      end
    end
  end

  private

  def reservation_params
    # Only permit necessary parameters
    params.require(:reservation).permit(:number_people, :status, :table_id)
  end
end
