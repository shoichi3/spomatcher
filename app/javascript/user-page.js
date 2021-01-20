$(function(){
  $('#favorited-post').on('click', function(){
    $('.active').removeClass('active');
    $('.user-favorite-post').addClass('active');
    $('.show').removeClass('show');
    $('.giving-post2').addClass('show');
  })

  $('#lasted-post').on('click', function(){
    $('.active').removeClass('active');
    $('.user-last-post').addClass('active');
    $('.show').removeClass('show');
    $('.giving-post').addClass('show');
  })
})