require 'rails_helper'

feature 'Category Excursion' do
  let(:category) { create(:category_excursion_with_excursion) }

  before do
    visit category_excursion_path(category)
  end

  scenario 'View category excursion' do
    expect(all('tr').count).to eq(category.excursions.count)

    category.excursions.each do |excursion|
      expect(page).to have_link(excursion.title, excursion_path(excursion))
    end
  end

  scenario 'Click excursion link' do
    excursion = category.excursions.first
    click_link(excursion.title)

    expect(page.current_path).to eq(excursion_path(excursion))
  end
end
