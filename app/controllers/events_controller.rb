class EventsController < ApplicationController
  before_action :require_admin

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.valid?
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
end