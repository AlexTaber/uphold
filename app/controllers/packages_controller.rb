class PackagesController < ApplicationController
  before_action :require_admin
  before_action :convert_price_to_f, only: [:create]
  before_action :package_by_id, only: [:update, :destroy]

  def create
    @package = Package.new(package_params)

    if @package.valid?
      @package.save
      flash[:notice] = "Successfully added package"
    else
      flash[:warn] = "Unable to save package, please try again"
    end

    redirect_to :back
  end

  def update
  end

  def destroy
    if @package.delete
      flash[:notice] = "Ticket package deleted"
    else
      flash[:warn] = "Unable to delete Ticket Package, please try again"
      redirect_to :back
    end
  end

  private

  def package_by_id
    @package = Package.find_by(id: params[:id])
  end

  def package_params
    params.require(:package).permit(:name, :description, :price, :event_id)
  end

  def convert_price_to_f
      params[:package][:price] = params[:package][:price].to_f
    end
end
