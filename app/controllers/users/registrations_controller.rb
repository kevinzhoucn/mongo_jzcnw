class Users::RegistrationsController < Devise::RegistrationsController
  def new    
    set_seo_meta t("menu.user_registration")
    super
  end

  protected
    def after_sign_up_path_for(resource)
      '/users/reg/succeed'
    end
end