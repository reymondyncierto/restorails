class MainController < ApplicationController
  def index
    @date = Date.today
    @date = @date.beginning_of_week(:sunday)
    @reservation = Reservation.new
    # sort of alerts
    # flash[:notice] = "Logged in successfully"
    # flash[:alert] = "Invalid email or password"
  end
end
