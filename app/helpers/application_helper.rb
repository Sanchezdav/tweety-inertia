module ApplicationHelper
  ActionView::Base.default_form_builder = TailwindFormBuilder

  def user_gravatar(user, size)
    image_tag(user.gravatar_url, alt: user.name, width: size, height: size, class: 'rounded-full')
  end
end
