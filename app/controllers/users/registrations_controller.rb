class Users::RegistrationsController < Devise::RegistrationsController
  def new    
    set_seo_meta t("menu.user_registration")
    super
  end
end