class Event < ActiveRecord::Base
  has_many :bookings
  has_many :bands, through: :bookings
  has_and_belongs_to_many :events
  belongs_to :venue
  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  has_many :sounds, as: :soundable
  has_many :links, as: :linkable
  has_many :sales

  def self.pending
    self.where(live: false)
  end

  def bookings_by_rank
    bookings.order(:rank)
  end

  def headliners
    bookings_by_rank[0...total_headliners]
  end

  def openers
    bookings_by_rank[total_headliners...bookings.count]
  end

  def reset_bookings_order
    bookings_by_rank.each_with_index { |booking, index| booking.update_attribute(:rank, index) }
  end

  def self.all_upcoming_events
    self.all.select(&:active).sort_by { |event| event.start_time }
  end

  def active
    live && start_time > DateTime.now - 5.hours
  end

  def events_to_s(events)
    str = ""
    events.each { |headliner| str += "#{headliner.band.name} | " }
    str[0..-3]
  end

  def headliners_to_s
    events_to_s(headliners)
  end

  def openers_to_s
    events_to_s(openers)
  end

  def start_date_to_s
     start_time.strftime('%A, %B %d')
  end

  def times_to_s
    "#{start_time_to_s} - #{end_time_to_s}"
  end

  def start_time_to_s
    start_time.strftime('%l:%M%P')
  end

  def end_time_to_s
    end_time.strftime('%l:%M%P')
  end
end
