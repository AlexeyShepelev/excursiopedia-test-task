require 'rails_helper'

feature 'City' do
  include_context :application

  let(:city) { create :city }
  let!(:excursion) { create(:excursion, city: city) }

  scenario 'View cities list' do
    city_1, city_2, city_3 = create_list(:city, 3)
    excursions_1 = create_list(:excursion_with_categories, 9, city: city_1)
    excursions_2 = create_list(:excursion_with_categories, 2, city: city_2)

    visit cities_path

    expect_data_in_table("#city_#{city_1.id}", city_1, excursions_1, :title)
    expect_data_in_table("#city_#{city_2.id}", city_2, excursions_2, :title)

    expect(page).to have_no_content(city_3.name)
  end

  scenario 'Click excursion link' do
    visit root_path
    click_link(excursion.title)

    expect(page.current_path).to eq(excursion_path(excursion))
  end

  scenario 'Click city link' do
    visit root_path
    click_link(city.name)

    expect(page.current_path).to eq(city_path(city))
  end
end
