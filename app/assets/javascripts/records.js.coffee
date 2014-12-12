# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.Records =
  favorite : (el) ->
    record_id = $(el).data("id")
    if $(el).hasClass("small_bookmarked")
      $.ajax
        url : "/records/#{record_id}/unfavorite"
        type : "DELETE"
      $(el).attr("title","收藏")
      $(el).text("收藏")
      $(el).attr("class","icon small_bookmark")
    else
      $.post "/records/#{record_id}/favorite"
      $(el).attr("title","取消收藏")
      $(el).text("取消收藏")
      $(el).attr("class","icon small_bookmarked")
    false

  