class User < ActiveRecord::Base
  has_many   :sales
  has_many   :articles
  belongs_to :venue
  has_and_belongs_to_many :bands
end