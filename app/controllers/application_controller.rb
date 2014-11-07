class ApplicationController < ActionController::Base    
  layout :layout_by_resource
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_index_bar
  after_filter :store_location

  protect_from_forgery

  protected
    def layout_by_resource
      if controller_name == 'profile'
        "appprofile"
      else
        "application"
      end
    end

    def set_index_bar
      if controller_name == 'home' && action_name == 'index'
        @home_index_bar = true
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:phone_number, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:phone_number) }
    end

    def store_location
      # store last url - this is needed for post-login redirect to whatever the user last visited.
      return unless request.get? 
      if (request.path != "/users/sign_in" &&
          request.path != "/users/sign_up" &&
          request.path != "/users/password/new" &&
          request.path != "/users/password/edit" &&
          request.path != "/users/confirmation" &&
          request.path != "/users/sign_out" &&
          !request.xhr?) # don't store ajax calls
        session[:previous_url] = request.fullpath 
      end
    end

    def after_sign_in_path_for(resource)
      session[:previous_url] || root_path
    end
end
