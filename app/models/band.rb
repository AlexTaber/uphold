class Band < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :bookings
  has_many :events, through: :bookings
  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  has_many :sounds, as: :soundable
  has_many :links, as: :linkable
  has_many :musicians
  belongs_to :service
end