$(function(){
  $('#following').on('click', function(){
    $('.active').removeClass('active');
    $('#following').addClass('active');
    $('.show').removeClass('show');
    $('.follower-list2').addClass('show');
  })

  $('#follower').on('click', function(){
    $('.active').removeClass('active');
    $('#follower').addClass('active');
    $('.show').removeClass('show');
    $('.follower-list').addClass('show');
  })
})
