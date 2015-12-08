class MusiciansController < ApplicationController
  before_action :require_admin, except: [:show]

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)

    if @musician.valid?
      @musician.save
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
    params.require(:musician).permit(:first_name, :last_name, :bio, :instruments, :band_id)
  end
end
