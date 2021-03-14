class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  def label_default(method, text = nil, options = {}, &block)
    label(method, text, merge_class(options, 'block text-black'), &block)
  end

  def text_field(method, options = {})
    super(method, merge_class(options, "input #{'input--error' if @object.errors.any?}"))
  end

  def text_field_with_errors(method, options = {})
    text_field(method, options) + attribute_errors(@object, method)
  end

  def email_field(method, options = {})
    super(method, merge_class(options, "input #{'input--error' if @object.errors.any?}"))
  end

  def email_field_with_errors(method, options = {})
    email_field(method, options) + attribute_errors(@object, method)
  end

  def password_field(method, options = {})
    super(method, merge_class(options, "input #{'input--error' if @object.errors.any?}"))
  end

  def password_field_with_errors(method, options = {})
    password_field(method, options) + attribute_errors(@object, method)
  end

  private

  def attribute_errors(resource, method)
    @template.content_tag(:span, class: 'text-red-500') do
      return '' unless resource.errors.has_key?(method)

      resource.errors.full_messages_for(method).join(', ')
    end
  end

  def merge_class_attribute_value(options, value)
    new_options = options.clone
    new_options[:class] = [value, new_options[:class]].join(" ")
    new_options
  end

  alias_method :merge_class, :merge_class_attribute_value
end
