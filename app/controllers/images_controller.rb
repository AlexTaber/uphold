class ImagesController < ApplicationController
  before_action :require_admin
  before_action :image_by_id

  def destroy
    if @image.delete
      flash[:notice] = "Image deleted"
    else
      flash[:warn] = "Could not delete image, please try again"
    end

    redirect_to :back
  end

  private

  def image_by_id
    @image = Image.find_by(id: params[:id])
  end
end
