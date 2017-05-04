self.addEventListener("push", function(event) {
  var json = event.data.json();
  self.registration.showNotification(json.title, {
    body: json.body
  });
});

self.addEventListener("notificationclick", function(event) {
  event.notification.close();

  clients.openWindow("/");
}, false);
