module ApplicationHelper
  def nav_link(link_icon, link_text, link_path, params={})

    is_current_page = url_for(:controller => controller_name, :action => action_name) == link_path

    class_name = is_current_page ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_path, params do
        content_tag(:i, nil, :class => link_icon) +
        link_text
      end
    end
  end
end
