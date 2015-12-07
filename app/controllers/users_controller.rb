class UsersController < ApplicationController
  before_action :require_admin, only: [:admin]

  def admin
  end
end