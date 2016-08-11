App.users = App.cable.subscriptions.create("UsersChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    updateUsers(data);
  } 
});