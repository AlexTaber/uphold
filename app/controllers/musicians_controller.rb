class MusiciansController < ApplicationController
  before_action :require_admin, except: [:show]

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)

    if @musician.valid?
      @musician.save
      set_up_bands if params[:musician][:band_ids]

      unless params[:musician][:file]
        #placeholder image
          @image = Image.create(url: "http://torrancecrossfit.com/wp-content/uploads/2014/06/jlnovotngmail-com.jpeg", imageable_id: @musician.id, imageable_type: "Musician")
        #----
      else
        upload_image(params[:musician][:file], @musician)
      end

      flash[:notice] = "Musician #{@musician.name} successfully added"
      redirect_to admin_path
    else
      flash[:warn] = "Unable to save musician, please try again"
      redirect_to :back
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def musician_params
    params.require(:musician).permit(:first_name, :last_name, :bio, :instruments)
  end

  def set_up_bands
    band_ids = params[:musician][:band_ids].reject!(&:empty?)
    band_ids.each do |band_id|
      BandMember.create(
        band_id: band_id,
        musician_id: @musician.id
      )
    end
  end
end
