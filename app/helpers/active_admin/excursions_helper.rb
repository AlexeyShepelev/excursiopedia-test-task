module ActiveAdmin::ExcursionsHelper
  def has_many_to_links(object, method)
    object.send(method).map do |item|
      if can?(:manage, item)
        link_to(item.name, "/admin/#{method}/#{item.id}")
      else
        item.name
      end
    end.join(', ').html_safe
  end
end
