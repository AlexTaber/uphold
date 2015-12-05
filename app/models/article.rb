class Article < ActiveRecord::Base
  belongs_to :user
  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  has_many :sounds, as: :soundable
end