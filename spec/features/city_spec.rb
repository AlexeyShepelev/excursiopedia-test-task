require 'rails_helper'

feature 'City' do
  include_context :application

  let(:city) { create :city }
  let!(:excursion) { create(:excursion_with_categories, city: city) }

  describe 'Index page' do
    scenario 'View cities list' do
      list_limit = Settings.cities.excursions_limit

      city_1, city_2, city_3, city_4 = create_list(:city, 4)
      create_list(:excursion_with_categories, 9, city: city_1)
      create_list(:excursion_with_categories, 2, city: city_2)
      create_list(:unpublished_excursion, 3, city: city_3)

      visit cities_path

      expect_data_in_table("#city_presenter_#{city_1.id}", city_1, :excursions, limit: list_limit)
      expect_data_in_table("#city_presenter_#{city_2.id}", city_2, :excursions, limit: list_limit)

      expect(page).to have_no_content(city_3.name)
      expect(page).to have_no_content(city_4.name)
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

  describe 'Show page' do
    scenario 'View city' do
      excursions = create_list(:excursion_with_categories, 9, city: city)
      unpublished_excursions = create_list(:unpublished_excursion, 2, city: city)

      visit city_path(city)

      excursions.each do |exc|
        expect_data_in_table("#excursion_#{exc.id}", exc, :category_excursions)
      end

      unpublished_excursions.each do |exc|
        expect(page).to have_no_content(exc.title)
      end
    end

    scenario 'Click excursion link' do
      visit city_path(city)
      click_link(excursion.title)

      expect(page.current_path).to eq(excursion_path(excursion))
    end

    scenario 'Click category link' do
      category = excursion.category_excursions.first

      visit city_path(city)
      click_link(category.name)

      expect(page.current_path).to eq(category_excursion_path(category))
    end
  end
end
