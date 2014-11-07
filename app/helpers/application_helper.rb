module ApplicationHelper
  def jz_build_link(url, args)
    items = '?'
    args.each do |arg|
      items = items + arg + '&'
    end
    url = url + items
  end

  def render_page_title
    title = @page_title ? "#{@page_title} | #{SITE_NAME}" : SITE_NAME rescue "SITE_NAME"
    content_tag("title", title, nil, false)
  end

  def controller_stylesheet_link_tag
    case controller_name
    when "home", "resumes", "profiles"
      stylesheet_link_tag controller_name
    else
      stylesheet_link_tag "home"
    end
  end

  def controller_javascript_include_tag
    case controller_name
    when "home", "resumes", "profiles"
      javascript_include_tag controller_name
    else
      javascript_include_tag "home"    
    end
  end
end
