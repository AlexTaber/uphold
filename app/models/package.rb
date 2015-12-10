class Package < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :sales
  belongs_to :event

  def price_to_s
    price > 0 ? number_to_currency(price) : "Free"
  end
end