import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  	$('.append_comment').append('<p>'+data.username+'</p>'+'<p>'+data.content+'</p>');
    $('.count-comment').text(data.count);
    // Called when there's incoming data on the websocket for this channel
  }
});
