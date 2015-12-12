class Venue < ActiveRecord::Base
  geocoded_by :address

  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  has_many :users
  has_many :events
  has_many :links, as: :linkable
  belongs_to :profile_image, class_name: "Image", foreign_key: "profile_image_id"
  belongs_to :cover_image, class_name: "Image", foreign_key: "cover_image_id"

  def address
    [street, city, state, country].compact.join(', ')
  end

  def city_state_to_s
    "#{city}, #{state}"
  end

  def active_profile_image
    profile_image || images.first
  end

  def active_cover_image
    cover_image || images.first
  end

  def upcoming_events
    events.select(&:active).sort_by { |event| event.start_time }
  end

  def past_events
    events.select(&:inactive).sort_by { |event| event.start_time }.reverse!
  end
end