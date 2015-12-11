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
end