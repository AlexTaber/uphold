class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_one :profile_image_owner, class_name: :event, foreign_key: "profile_image_id"
  has_one :cover_image_owner, class_name: :event, foreign_key: "cover_image_id"
  has_one :profile_image_owner, class_name: :venue, foreign_key: "profile_image_id"
  has_one :cover_image_owner, class_name: :venue, foreign_key: "cover_image_id"
end