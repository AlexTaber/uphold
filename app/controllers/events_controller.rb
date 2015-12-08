class EventsController < ApplicationController
  before_action :event_by_id, only: [:add_band, :update, :destroy]
  before_action :require_admin

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.valid?
      @event.save
      flash[:notice] = "Event #{@event.name} successfully added"
      redirect_to add_band_event_path(@event)
    else
      flash[:warn] = "Invalid event data, please try again"
      redirect_to :back
    end
  end

  def update
  end

  def destroy

  end

  def add_band
    @booking = Booking.new
  end

  private

  def event_by_id
    @event = Event.find_by(id: params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :total_headliners)
  end
end