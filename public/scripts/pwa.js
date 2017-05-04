function getSubscription() {
  return navigator.serviceWorker.ready
    .then(function(registration) {
      return registration.pushManager.getSubscription();
    });
}

if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('/sw.js');
  getSubscription()
    .then(function(s) {
      if (s) {
        setUnsubscribeButton();
      } else {
        setSubscribeButton();
      }
    });
}

function subscribe() {
  navigator.serviceWorker.ready.then(function(registration) {
    return Notification.requestPermission()
      .then(function(premission) {
        if (premission !== 'denied') {
          return registration.pushManager.subscribe({ userVisibleOnly: true })
            .then(function(s) {
              return fetch('/reg', {
                method: 'post',
                headers: {
                  'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'endpoint=' + s.endpoint
                  + '&p256dh=' + btoa(String.fromCharCode.apply(null, new Uint8Array(s.getKey('p256dh')))).replace(/\+/g, '-').replace(/\//g, '_')
                  + '&auth=' + btoa(String.fromCharCode.apply(null, new Uint8Array(s.getKey('auth')))).replace(/\+/g, '-').replace(/\//g, '_')
              }).then(setUnsubscribeButton);
            });
        }
      });
  });
}

function unsubscribe() {
  getSubscription().then(function(s) {
    return s.unsubscribe()
      .then(function() {
        return fetch('/unreg', {
          method: 'post',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: 'endpoint=' + s.endpoint
            + '&auth=' + btoa(String.fromCharCode.apply(null, new Uint8Array(s.getKey('auth')))).replace(/\+/g, '-').replace(/\//g, '_')
        }).then(setSubscribeButton);
      });
    });
}

function setSubscribeButton() {
  $('#sub button:first-child').removeClass('btn-primary').addClass('btn-default');
  $('#sub button:last-child').removeClass('btn-default').addClass('btn-primary');
}

function setUnsubscribeButton() {
  $('#sub button:first-child').removeClass('btn-default').addClass('btn-primary');
  $('#sub button:last-child').removeClass('btn-primary').addClass('btn-default');
}
