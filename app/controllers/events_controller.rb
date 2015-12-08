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

      unless params[:event][:file]
        #placeholder image - will erase this block
          @image = Image.create(url: "http://www.connexionsweb.com/wp-content/uploads/2015/03/businessLogo.png", imageable_id: @event.id, imageable_type: "Event")
        #----
      else
        params[:event][:file].each do |file|
          obj = S3_BUCKET.object(file.original_filename)

          obj.upload_file(file.tempfile, acl:'public-read')

          @image = Image.new(url: obj.public_url, imageable_id: @event.id, imageable_type: "Event")

          unless @image.save
            flash[:warn] = "There was a problem uploading your image(s), please try again"
          end
        end
      end

      flash[:notice] = "Event #{@event.name} successfully added"
      redirect_to add_band_event_path(@event)
    else
      flash[:warn] = "Invalid event data, please try again"
      redirect_to :back
    end
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

  end

  def add_band
    @booking = Booking.new
  end

  def pending
    @events = Event.where(live: false)
  end

  private

  def event_by_id
    @event = Event.find_by(id: params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :total_headliners, :live)
  end
end