require 'rails_helper'

feature 'Moderator' do
  include_context :active_admin

  let(:moderator) { create :moderator }

  before do
    admin_authenticate(moderator)
  end

  scenario 'Access denied for User pages' do
    access_denied_for_page('Users', admin_users_path)
  end

  scenario 'Access denied for City page' do
    access_denied_for_page('Cities', admin_cities_path)
  end

  scenario 'Access denied for Category Excursion page' do
    access_denied_for_page('Category Excursions', admin_category_excursions_path)
  end

  scenario 'Access success for Excursions page' do
    access_success_for_page('Excursions', admin_excursions_path)
  end

  describe 'Excursions' do
    let!(:excursion) { create :excursion_with_categories }

    scenario 'Visibility on edit page' do
      visit edit_admin_excursion_path(excursion)
      expect(all('#edit_excursion li.input').count).to eq(2)
      expect(find('#edit_excursion')).to have_selector("#excursion_title[disabled='disabled']")
      expect(find('#edit_excursion')).to have_selector('#excursion_description')
    end
  end

end
