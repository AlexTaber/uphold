class Booking < ActiveRecord::Base
  belongs_to :band
  belongs_to :event

  def is_headliner?
    rank < event.total_headliners
  end

  def headliner_text
    is_headliner? ? "(Headliner)" : ""
  end
end
