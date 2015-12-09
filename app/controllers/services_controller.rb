class ServicesController < ApplicationController
  def home
  end

  def media
  end

  def contact
  end

  def about
  end

  def live
    @events = Event.all_upcoming_events
  end

  def management
  end

  def agency
  end
end