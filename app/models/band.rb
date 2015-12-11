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
end