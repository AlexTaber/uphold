class VenuesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :venue_by_id, only: [:show, :edit, :update, :destroy, :add_assets]

  def index

  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.valid?
      @venue.save

      upload_images(@venue, "https://upload.wikimedia.org/wikipedia/commons/5/54/VENUE-2-02.jpg", params)

      flash[:notice] = "venue #{@venue.name} successfully added"
      redirect_to admin_path
    else
      flash[:warn] = "Invalid venue data, please try again"
      redirect_to :back
    end
  end

  def show

  end

  def edit

  end

  def update
    @venue.assign_attributes(venue_params)
    if @venue.valid?
      @venue.save

      upload_images(@venue, nil, params) if params[:venue][:file]

      flash[:notice] = "venue #{@venue.name} has been successfully posted"
      redirect_to :back
    else
      flash[:warn] = "Unable to save venue, please try again"
      redirect_to :back
    end
  end

  def destroy

  end

  def home
  end

  def add_assets

  end

  private

  def venue_by_id
    @venue = Venue.find_by(id: params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :bio, :street, :city, :state, :cover_image_id, :profile_image_id)
  end
end