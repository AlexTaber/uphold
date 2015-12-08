class Musician < ActiveRecord::Base
  belongs_to :band
  has_one :image, as: :imageable

  def name
    "#{first_name} #{last_name}"
  end
end