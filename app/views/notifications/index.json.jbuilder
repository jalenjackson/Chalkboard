json.array! @notifications do |notification|
  json.id notification.id
  #json.recipient notification.recipient
  json.image notification.actor.avatar
  json.actor notification.actor.firstname
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"

  end
  json.url pin_path(notification.notifiable.pin, anchor: dom_id(notification.notifiable))
end