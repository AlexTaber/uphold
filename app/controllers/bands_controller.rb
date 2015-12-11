class BandsController < ApplicationController
  before_action :find_by_id, only: [:destroy, :show, :update, :add_assets]
  before_action :require_admin, except: [:show]

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.valid?
      @band.save

      upload_images(@band, "http://p4cdn4static.sharpschool.com/UserFiles/Servers/Server_91869/Image/Band4.jpg", params)

      flash[:notice] = "Band #{@band.name} successfully added"
      redirect_to add_assets_band_path(@band)
    else
      flash[:warn] = "Unable to save band entry, please try again"
      redirect_to :back
    end
  end

  def show
  end

  def update
    @band.assign_attributes(band_params)
    if @band.valid?
      @band.save

      upload_images(@band, nil, params) if params[:band][:file]

      flash[:notice] = "band #{@band.name} has been successfully posted"
      redirect_to :back
    else
      flash[:warn] = "Unable to save band, please try again"
      redirect_to :back
    end
  end

  def destroy
    flash[:warn] = "Unable to delete event, please try again" unless @band.delete
    redirect_to :back
  end

  def add_assets
    @musician = Musician.new
  end

  private

  def find_by_id
    @band = Band.find_by(id: params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :bio, :service_id, :profile_image_id, :cover_image_id)
  end
end