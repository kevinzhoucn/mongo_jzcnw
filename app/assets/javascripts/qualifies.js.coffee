# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".qualify .item2").click ->
    $("div.total").css('display', 'none');
    $("div.want").css('display', 'none');
    $("div.agent").css('display', 'block');
  $(".qualify .item1").click ->
    $("div.agent").css('display', 'none');
    $("div.want").css('display', 'none');
    $("div.total").css('display', 'block');
  $(".qualify .item3").click ->
    $("div.agent").css('display', 'none');
    $("div.total").css('display', 'none');
    $("div.want").css('display', 'block');
