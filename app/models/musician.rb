class Musician < ActiveRecord::Base
  belongs_to :band
  has_one :image, as: :imageable
  has_many :band_members
  has_many :bands, through: :band_members

  def name
    "#{first_name} #{last_name}"
  end
end