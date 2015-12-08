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
    set_up_band if params[:event][:band_ids]
    remove_band if params[:event][:remove_band_id]
    redirect_to :back
  end

  def destroy

  end

  def add_band
  end

  private

  def event_by_id
    @event = Event.find_by(id: params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time)
  end

  def set_up_band
    band = Band.find_by(id: params[:event][:band_ids])
    band ? @event.bands << band : flash[:warn] = "There was a problem saving band submissions. Please check event page and update if needed"
  end

  def remove_band
    band = Band.find_by(id: params[:event][:remove_band_id])
    @event.bands.delete(band) if band
  end
end