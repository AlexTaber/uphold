class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_current_user, :require_admin, :is_admin?

  def require_current_user
    unless current_user
      flash.now[:warn] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    unless is_admin?
      flash[:warn] = "You must be an admin to perform that action"
      redirect_to root_path
    end
  end

  def is_admin?
    current_user && current_user.admin
  end

  def upload_images(item, default_url, params)
    unless params[:event][:file]
      #placeholder image
        @image = Image.create(url: default_url, imageable_id: item.id, imageable_type: item.class.to_s)
      #----
    else
      params[:event][:file].each do |file|
        upload_image(file, item)
      end
    end
  end

  def upload_image(file, item)
    obj = S3_BUCKET.object(file.original_filename)

    obj.upload_file(file.tempfile, acl:'public-read')

    @image = Image.new(url: obj.public_url, imageable_id: item.id, imageable_type: item.class.to_s)

    unless @image.save
      flash[:warn] = "There was a problem uploading your image(s), please try again"
    end
  end
end
