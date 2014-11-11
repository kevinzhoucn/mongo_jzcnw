# coding: utf-8
module RecordsHelper  
  def record_favorite_tag(record)
    return "" if current_user.blank?
    class_name = "bookmark"
    link_title = "收藏"
    if current_user && current_user.favorite_record_ids.include?(record.id)
      class_name = "bookmarked"
      link_title = "取消收藏"
    end

    link_to("#{link_title}", "#", class: "icon small_#{class_name}", title: link_title,
            onclick: "return Records.favorite(this);", 'data-id' => record.id)
  end
end
