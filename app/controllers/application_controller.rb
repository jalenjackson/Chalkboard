class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    pins_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :themes,  :lastname,:username, :image,  :avatar, :description,  :city, :state, :occupation, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :themes,  :lastname, :image,  :avatar, :description, :city, :state])
  end

  def follow
    following << other_user
  end

  def unfollow
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end


end
