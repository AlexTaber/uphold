class BandsController < ApplicationController
  before_action :require_admin, except: [:show]

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.valid?
      @band.save
      flash[:notice] = "Band #{@band.name} successfully added"
      redirect_to admin_path
    else
      flash[:warn] = "Unable to save band entry, please try again"
      redirect_to :back
    end
  end

  def show
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name, :bio, :service_id)
  end
end