// function message() {
//   const submit = document.getElementById("submit");
//   submit.addEventListener("click", (e) => {
//     const formData = new FormData(document.getElementById("form"));
//     const url = location.pathname
//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", url, true);
//     XHR.responseType = "json";
//     XHR.send(formData);
//     XHR.onload = () => {
//       const message = XHR.response.message;
//       const user = XHR.response.user;
//       const image = XHR.response.image;
//       console.log(image);
//       const user_icon = url_for(image);
//       const messageText = document.getElementById("message-text");
//       const messageImage = document.getElementById("message-image");
//       const lastMessage = document.getElementById("message")
//       const date = moment(message.created_at);

//       const HTML = `
//         <div class="messages">
//           <div class="left">
//             <div class="user-image">
//              ${user_icon}
//             </div>
//           </div>
//           <div class="right">
//             <div class="info">
//               <div class="user-name">
//                 ${user.name}
//               </div>
//               <div class="message-time">
//                 ${date.format("YYYY/MM/DD HH:mm")}
//               </div>
//             </div>
//             <div class="message">
//               ${message.text}
//             </div>
//           </div>
//         </div>`;

//         lastMessage.insertAdjacentHTML("afterend", HTML);
      
//       messageText.value = "";
//       messageImage.value = "";

//       if (XHR.status != 200) {
//         alert(`Error ${XHR.status}: ${XHR.statusText}`)
//       } else {
//         return nill;
//       }
//     };

//     XHR.onerror = function () {
//       alert("Request failed");
//     }

//     e.preventDefault();
//   })
// }

// window.addEventListener("load", message);

// $(document).on('turbolinks:load', function(){
//   $('#form').on('submit', function(e){
//     e.preventDefault();
//     const message = new FormData(this);
//     console.log("1");
//   });
// });

function buildHTML(message) {
  const user_image = (message.user_image) ? `<img class="user-image" src=${message.user_image}>`: `<img class="user-image" src="app/assets/images/default.png"`
  const message_image = (message.image) ? `<img class="image" src=${message.image}>`: ''
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