module ApplicationHelper
  def jz_build_link(url, args)
    items = '?'
    args.each do |arg|
      items = items + arg + '&'
    end
    url = url + items
  end
end
