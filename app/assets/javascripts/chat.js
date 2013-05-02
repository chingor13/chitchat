$(function() {
  function pollForMessages() {
    var container = $('*[data-chat-id]');
    $.ajax("/chats/" + container.data('chat-id') + '.json', {
      context: container,
      success: function(data, status, xhr) {
        var messages = data.chat.messages, message;
        for(var i = 0; i < messages.length; i++) {
          message = messages[i];
          if(this.find('*[data-message-id="' + message.id + '"]').length == 0) {
            this.append('<li data-message-id="' + message.id + '">' + message.body + '</li>');
          }
        }
        setTimeout(pollForMessages, 3000);
      }
    });
  }
  pollForMessages();

  $("form").bind('ajax:complete', function(evt) {
    this.reset();
  });

});
