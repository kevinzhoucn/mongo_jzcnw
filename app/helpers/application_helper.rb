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

  def render_page_keywords_descriptoin
    keywords = @meta_keywords ? "#{@meta_keywords},#{SITE_KEYWORDS}" : SITE_KEYWORDS rescue "SITE_KEYWORDS"
    meta_content = content_tag("meta", nil, { name: 'keywords', content: "#{keywords}" }, false)
    description = @meta_description ? "#{@meta_description} | #{SITE_DESCRIPION}" : SITE_DESCRIPION rescue "SITE_DESCRIPION"
    meta_content << content_tag("meta", nil, { name: 'description', content: "#{description}" }, false)
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

  def random_tips
    return "" if SiteConfig.tips.blank?
    SiteConfig.tips.split("&&").sample
  end
end
