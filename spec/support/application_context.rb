shared_context :application do

  # The option limit = 10 show not more than 10 child objects. For example:
  #
  #  expect_data_in_table('#table', city, :excursions, limit: 10)
  def expect_data_in_table(selector, main_object, association_method, options = {})
    child_objects = main_object.send(association_method)
    children_count = child_objects.count
    list_limit = options[:limit] || children_count

    table = find(selector)
    expect(table.all('tbody tr').count).to eq([children_count, list_limit].min)
    expect(table.find('th')).to have_link(main_object.name, href: url_for([main_object, { only_path: true }]))

    child_objects[0...list_limit].each do |object|
      expect(table).to have_link(object.name, href: url_for([object, { only_path: true }]))
    end

    if children_count > list_limit
      child_objects[list_limit...children_count].each do |object|
        expect(table).to have_no_link(object.name, href: url_for([object, { only_path: true }]))
      end
    end
  end

end
