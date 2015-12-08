class MusiciansController < ApplicationController
  before_action :require_admin, except: [:show]

  def new
    @musician = Musician.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
