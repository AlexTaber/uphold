class Venue < ActiveRecord::Base
  geocoded_by :address

  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  has_many :users
  has_many :events
  has_many :links, as: :linkable

  def address
    [street, city, state, country].compact.join(', ')
  end

  def city_state_to_s
    "#{city}, #{state}"
  end
end