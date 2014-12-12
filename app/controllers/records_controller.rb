class RecordsController < ApplicationController
  def index
  end

  def show
    set_seo_meta t("menu.view")
    add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"
    @record = Record.find(params[:id])
    @record.inc(:hits, 1)
    cat_title = Category.find(@record.category_id).title
    @replies = @record.replies.unscoped.without_body.asc(:_id)
    add_breadcrumb cat_title, zizhi_daiban_path(@record.category_id), class: "link_4a1"#, onclick: "return false"
    fresh_when(etag: [@record])
  end

  def favorite
    current_user.favorite_record(params[:id])
    render text: '1'
  end

  def unfavorite
    current_user.unfavorite_record(params[:id])
    render text: '1'
  end
end
