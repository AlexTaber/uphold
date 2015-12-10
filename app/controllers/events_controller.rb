class EventsController < ApplicationController
  before_action :event_by_id, only: [:show, :add_event_asset, :edit, :update, :destroy]
  before_action :require_admin, except: [:show, :index]

  def index
    @events = Events.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.valid?
      @event.save

      upload_images(@event, "http://www.connexionsweb.com/wp-content/uploads/2015/03/businessLogo.png", params)

      flash[:notice] = "Event #{@event.name} successfully added"
      redirect_to add_event_asset_event_path(@event)
    else
      flash[:warn] = "Invalid event data, please try again"
      redirect_to :back
    end
  end

  def show
  end

  def edit
  end

  def update
    @event.assign_attributes(event_params)
    if @event.valid?
      @event.save
      flash[:notice] = "Event #{@event.name} has been successfully posted"
      redirect_to live_path
    else
      flash[:warn] = "Unable to save event, please try again"
      redirect_to :back
    end
  end

  def destroy
    if @event
      @event.delete
      flash[:notice] = "Event successfully removed"
      redirect_to pending_path
    else
      flash[:warn] = "Unable to remove event, please try again"
      redirect_to :back
    end
  end

  def add_event_asset
    @booking = Booking.new
    @package = Package.new
  end

  def pending
    @events = Event.pending
  end

  private

  def event_by_id
    @event = Event.find_by(id: params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :total_headliners, :live, :venue_id)
  end
end