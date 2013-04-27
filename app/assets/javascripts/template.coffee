#template override for underscore to use {{}} instead of <%%>
_.templateSettings = interpolate : /\{\{(.+?)\}\}/g

$(document).ready ->
  for i of gon.notification

    if i == 'alert'
      alert_class = "error"

    Notifications.push
      text: gon.notification[i]
      class: alert_class
      autoDismiss: '3'
