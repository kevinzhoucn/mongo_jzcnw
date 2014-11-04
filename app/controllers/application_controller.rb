class ApplicationController < ActionController::Base    
  layout :layout_by_resource
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery

  protected
    def layout_by_resource
      if controller_name == 'profile'
        "appprofile"
      else
        "application"
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:phone_number, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:phone_number) }
    end
end
