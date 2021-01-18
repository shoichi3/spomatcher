function buildHTML(message) {
  const user_image = (message.user_image) ? `<img class="user-image" src=${message.user_image}>`:`<img class="user-image" src="app/assets/images/default.png"`;
  const message_image = (message.image) ? `<img class="image" src=${message.image}>`:"";
  const HTML = `
            <div class="messages">
              <div class="left">
                ${user_image}
              </div>
              <div class="right">
                <div class="info">
                  <div class="user-name">
                    ${message.user_name}
                  </div>
                  <div class="message-time">
                    ${message.created_at}
                  </div>
                </div>
                <div class="message">
                  ${message.text}
                </div>
                <div class="attached-image">
                  ${message_image}
                </div>
              </div>
            </div>`
  return HTML;
}

$(function(){
  $('#form').on('submit', function(e){
    e.preventDefault();
    const message = new FormData(this);
    const url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: message,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      const html = buildHTML(data);
      $('#message').append(html);
      $('#message-text').val('');
      $('#message-image').val('');
      $('input').prop('disabled', false);
      $('.communication').animate({ scrollTop: $('.communication')[0].scrollHeight}, 50);
    });
  });
});