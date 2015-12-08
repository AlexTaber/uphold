class BandsController < ApplicationController
  before_action :find_by_id, only: [:destroy, :show]
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
    flash[:warn] = "Unable to delete event, please try again" unless @band.delete
    redirect_to :back
  end

  private

  def find_by_id
    @band = Band.find_by(id: params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :bio, :service_id)
  end
end