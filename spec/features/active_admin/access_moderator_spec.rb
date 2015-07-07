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

  scenario 'Access denied for Excursions page' do
    access_denied_for_page('Excursions', admin_excursions_path)
  end

  scenario 'Access denied for Category Excursion page' do
    access_denied_for_page('Category Excursions', admin_category_excursions_path)
  end
end
