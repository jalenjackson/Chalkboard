module UsersHelper
  def avatar_for(user, options = {size: 80})
    size = options[:size]
    if user.avatar?
    image_tag user.avatar.url(:thumb), size: size, class: 'avatar-image'
    else
      image_tag "logo.png", width: size, class: 'avatar-image'
      end
  end

  def background_for(user)
    if user.image?
      image_tag user.image.url(:large)
    else
      image_tag "logo.png",  class: 'profile-image'
    end
  end
end

