class Users::SessionsController < Devise::SessionsController
  def new    
    set_seo_meta t("menu.user_sign_in")
    super
  end
end