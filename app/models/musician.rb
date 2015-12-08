class Musician < ActiveRecord::Base
  belongs_to :band
  has_one :image, as: :imageable
end