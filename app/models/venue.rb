class Venue < ActiveRecord::Base
  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  has_many :users
  has_many :links, as: :linkable
end