module UsersHelper
  def user_avatar(user: user, id: id, clazz: clazz)
    begin
      if user.icon?
        link_to image_tag(user.icon.url, id: id, class: clazz), user
      else
        link_to image_tag('anyone_icon.png', id: id, class: clazz), user
      end
    rescue => e
      logger.error e
      logger.error e.backtrace.join("\n")
      return image_tag 'anyone_icon.png';
    end
  end
end
