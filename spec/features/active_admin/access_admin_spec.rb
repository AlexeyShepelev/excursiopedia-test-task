require 'rails_helper'

feature 'Admin' do
  include_context :active_admin

  let(:admin) { create :admin }

  before do
    admin_authenticate(admin)
  end

  scenario 'Access success for User pages' do
    access_success_for_page('Users', admin_users_path)
  end

  scenario 'Access success for City page' do
    access_success_for_page('Cities', admin_cities_path)
  end

  scenario 'Access success for Excursions page' do
    access_success_for_page('Excursions', admin_excursions_path)
  end

  scenario 'Access success for Category Excursion page' do
    access_success_for_page('Category Excursions', admin_category_excursions_path)
  end

  describe 'Excursions' do
    let!(:excursion) { create :excursion_with_categories }

    scenario 'Visibility on edit page' do
      visit edit_admin_excursion_path(excursion)
      expect(find('#edit_excursion')).to have_selector("#excursion_title:not([disabled='disabled'])")
    end
  end
end
