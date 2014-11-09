# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  # $('#user_user_type_gongsi').attr("checked", false)
  bflag = $('#user_user_type_gongsi:checked').val()
  cflag = $('#user_user_type_lietou:checked').val()
  $('.corp_item').css('display','block') if ( bflag == 'gongsi' or cflag == 'lietou')

  $('#user_user_type_gongsi').click ->
    $('.corp_item').css('display','block');
  $('#user_user_type_geren').click ->
    $('.corp_item').css('display','none');
  $('#user_user_type_lietou').click ->
    $('.corp_item').css('display','block');

  $('.dropdown-menu').css('display': 'none');
  #$('.dropdown-toggle').click ->
  #  $('.dropdown-menu').toggle();