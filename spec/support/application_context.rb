shared_context :application do

  def expect_data_in_table(selector, main_object, child_objects)
    list_limit = Settings.cities.excursions_limit
    children_count = child_objects.count

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
