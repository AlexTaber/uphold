class BookingsController < ApplicationController
  before_action :require_admin
  before_action :booking_by_id, only: [:destroy]

  def create
    @booking = Booking.new(booking_params)

    if @booking.valid?
      @booking.save
      flash[:notice] = "Successfully added band"
    else
      flash[:warn] = "Unable to save booking, please try again"
    end

    redirect_to :back
  end

  def update
  end

  def destroy
    if @booking
      @event = @booking.event
      @booking.delete
      @event.reset_bookings_order
      flash[:notice] = "Band removed from event"
    else
      flash[:warn] = "Unable to remove band from event, please try again"
    end

    redirect_to :back
  end

  private

  def booking_by_id
    @booking = Booking.find_by(id: params[:id])
  end

  def booking_params
    params.require(:booking).permit(:band_id, :event_id, :rank)
  end
end
