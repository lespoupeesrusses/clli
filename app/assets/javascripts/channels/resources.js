App.resources = App.cable.subscriptions.create("ResourcesChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var html = '<div><a href="' + data.resource.url + '"><img src="' + data.resource.image + '" class="img-fluid" />' + data.resource.title + '</a></div>';
    html += '<small>Added by ' + data.resource.author + '</small><br/>';
    toastr.info(html);
  }
});