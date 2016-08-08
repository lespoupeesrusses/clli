App.resources = App.cable.subscriptions.create("ResourcesChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    addResource(data.resource);
  }
});