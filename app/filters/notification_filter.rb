class NotificationFilter
  def self.filter(controller)
    # The template will display errors in special popups. Appearance of popups will be connected with flash classes.
    # currently the template supports following types of flash: :alert, :warning, :notice
    controller.gon.notification = controller.flash.to_hash
  end
end
