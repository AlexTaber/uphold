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
end