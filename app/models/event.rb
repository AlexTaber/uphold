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

  def reset_bookings_order
    bookings_by_rank.each_with_index { |booking, index| booking.update_attribute(:rank, index) }
  end

  def self.all_upcoming_events
    self.all.select(&:active)
  end

  def active
    live && start_time > DateTime.now
  end
end
