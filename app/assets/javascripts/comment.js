$(document).ready(function() {
  function buildHTML(message){
    var html =       `<div class="chat-upper">
                        <div class="chat-upper__name">
                          ${message.name}
                        </div>
                        <div class="chat-upper__date">
                          ${message.created_at}
                        </div>
                      </div>
                      <div class="chat-lower-message">
                        <p class="chat-lower-content">
                          ${message.text}
                        </p>
                        <p class="chat-lower-content-image">
                          ${message.image}
                        </p>
                      </div>`
    return html;
  }

  $('#new_message').on('submit', function(e){

    //デフォルトのブラウザ挙動を抑制
    e.preventDefault();

    var formData = new FormData($(this).get(0));
    var url = $(this).attr('action')
    // console.log(formData);
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-messeges').append(html);
      $('.message-form__field').val('');
      $(function() {
        $('.chat-center-view').animate({scrollTop: $('.chat-center-view')[0].scrollHeight}, 'fast');
      });
    })
    .fail(function(){
      alert('error');
    })
    return false;
  });
});
