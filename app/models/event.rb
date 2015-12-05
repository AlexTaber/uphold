class Event < ActiveRecord::Base
  has_and_belongs_to_many :bands
  belongs_to :venue
  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  has_many :sounds, as: :soundable
  has_many :sales
end