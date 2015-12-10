class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  def event
    package.event
  end
end