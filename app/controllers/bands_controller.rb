class BandsController < ApplicationController
  before_action :require_admin, except: [:show]

  def new
    @band = Band.new
  end

  def create
  end

  def show
  end

  def destroy
  end
end