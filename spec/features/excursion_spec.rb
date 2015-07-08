require 'rails_helper'

feature 'Excursion' do
  let!(:excursion) { create(:excursion_with_categories) }

  before do
    visit excursion_path(excursion)
  end

  scenario 'View excursion' do
    cells = all('dd')
    expect(cells[0]).to have_content(excursion.title)
    expect(cells[1]).to have_content(excursion.description)
    expect(cells[2]).to have_content(excursion.city.name)

    excursion.category_excursions.each do |category|
      expect(cells[3]).to have_link(category.name, category_excursion_path(category))
    end
  end

  scenario 'Click category link' do
    category = excursion.category_excursions.first
    click_link(category.name)

    expect(page.current_path).to eq(category_excursion_path(category))
  end
end
