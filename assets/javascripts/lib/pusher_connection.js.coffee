pusher = new Pusher gon.pusher.key,
  encrypted: gon.pusher.encrypted
  wsHost: gon.pusher.wsHost
  wsPort: gon.pusher.wsPort
  wssPort: gon.pusher.wssPort
  disableFlash: true
  disableStats: true
  enabledTransports: ['ws']
  disabledTransports: ['flash', 'sockjs']

window.pusher = pusher
