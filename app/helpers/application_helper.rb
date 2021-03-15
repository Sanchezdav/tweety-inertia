module ApplicationHelper
  ActionView::Base.default_form_builder = TailwindFormBuilder

  def user_gravatar(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, width: size, height: size, class: 'rounded-full')
  end
end
