module TabHelper

  def nav_link(options = {}, &block)
    if path = options.delete(:path)
      if path.respond_to?(:each)
        c = path.map { |p| p.split('#').first }
        a = path.map { |p| p.split('#').last }
      else
        c, a, _ = path.split('#')
      end
    else
      c = options.delete(:controller)
      a = options.delete(:action)
    end

    if c && a
      # When given both options, make sure BOTH are active
      klass = current_controller?(*c) && current_action?(*a) ? 'active' : ''
    else
      # Otherwise check EITHER option
      klass = current_controller?(*c) || current_action?(*a) ? 'active' : ''
    end

    # Add our custom class into the html_options, which may or may not exist
    # and which may or may not already have a :class key
    o = options.delete(:html_options) || {}
    o[:class] ||= ''
    o[:class] += ' ' + klass
    o[:class].strip!

    if block_given?
      content_tag(:li, capture(&block), o)
    else
      content_tag(:li, nil, o)
    end
  end

end