class Band < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :bookings
  has_many :events, through: :bookings
  has_many :band_members
  has_many :musicians, through: :band_members
  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  has_many :sounds, as: :soundable
  has_many :links, as: :linkable
  belongs_to :service
  belongs_to :profile_image, class_name: "Image", foreign_key: "profile_image_id"
  belongs_to :cover_image, class_name: "Image", foreign_key: "cover_image_id"

  def active_profile_image
    profile_image || images.first
  end

  def active_cover_image
    cover_image || images.first
  end

  def upcoming_events
    events.select(&:active).sort_by { |event| event.start_time }
  end

  def has_upcoming_events?
    upcoming_events.count > 0
  end

  def past_events
    events.select(&:past).sort_by { |event| event.start_time }.reverse!
  end

  def has_past_events?
    past_events.count > 0
  end

  def has_musicians?
    musicians.count > 0
  end
end