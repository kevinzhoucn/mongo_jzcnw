class ApplicationController < ActionController::Base    
  layout :layout_by_resource
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_index_bar
  after_filter :store_location

  protect_from_forgery

  def set_seo_meta(title = '',meta_keywords = '', meta_description = '')
    @page_title = "#{title}" if title.length > 0
    @meta_keywords = "#{meta_keywords}" if meta_keywords.length > 0
    @meta_description = "#{meta_description}" if meta_description.length > 0
  end

  def set_hightlight_nav(id = 1)
    case id
    when 1
      @nav_01 = true
    when 2
      @nav_02 = true
    when 3
      @nav_03 = true
    when 4
      @nav_04 = true
    end
  end

  def fresh_when(opts = {})
    opts[:etag] ||= []
    # 保证 etag 参数是 Array 类型
    opts[:etag] = [opts[:etag]] unless opts[:etag].is_a?(Array)
    # 加入页面上直接调用的信息用于组合 etag
    opts[:etag] << current_user
    # Config 的某些信息
    opts[:etag] << SiteConfig.custom_head_html
    opts[:etag] << SiteConfig.footer_html
    # 加入通知数量
    # opts[:etag] << unread_notify_count
    # 加入flash，确保当页面刷新后flash不会再出现
    opts[:etag] << flash
    # 所有 etag 保持一天
    opts[:etag] << Date.current
    super(opts)
  end

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
