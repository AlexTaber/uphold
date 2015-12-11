class VenuesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :venue_by_id, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @venue = Venue.new
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

  def home
  end
end