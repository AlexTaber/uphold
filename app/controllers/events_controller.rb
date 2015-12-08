class EventsController < ApplicationController
  before_action :require_admin

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.valid?
      set_up_bands
      @event.save
      flash[:notice] = "Event #{@event.name} successfully added"
      redirect_to admin_path
    else
      flash[:warn] = "Invalid event data, please try again"
      redirect_to :back
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time)
  end

  def set_up_bands
    bands = params[:event][:band_ids].delete_if{ |x| x.empty? }
    bands.each do |band_id|
      band = Band.find_by(id: band_id)
      band ? @event.bands << band : flash[:warn] = "There was a problem saving band submissions. Please check event page and update if needed"
    end
  end
end