module InertiaJson
  extend ActiveSupport::Concern

  def jbuilder(&block)
    JbuilderTemplate.new(view_context, &block).attributes!
  end
end
