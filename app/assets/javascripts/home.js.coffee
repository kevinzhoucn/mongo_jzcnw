# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#user_user_type_gongsi').click ->
    $('.corp_item').css('display','block');
  $('#user_user_type_geren').click ->
    $('.corp_item').css('display','none');
  $('#user_user_type_lietou').click ->
    $('.corp_item').css('display','none');