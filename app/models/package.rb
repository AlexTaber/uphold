class Musician < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many: :sales
  belongs_to: :event
end