$(document).on('turbolinks:load', function(){
  $(function(){
    function buildMESSAGE(message) {
    var messages = $('.chat-center-view').append(
                    `<div class="chat-messages" data-id=${message.id}>
                        <div class="chat-upper">
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
                        </div>
                      </div>`
  )}
    setInterval(update, 6000);
    var interval = setInterval;
    function update(){
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      if($('.chat-messages')[0]){
        var message_id = $('.chat-messages:last').data('id');
      }
      else {
        var message_id = 0
        return false;
      }
      $.ajax({
        url: location.href,
        type: 'GET',
        data: {
          message: { id: message_id }
        },
        dataType: 'json'
      })
      .done(function(data){
        console.log(data);
        $.each(data, function(i, data){
          buildMESSAGE(data);
        });
      })

      } else {
      clearInterval(interval);
    };
  };
  });
});