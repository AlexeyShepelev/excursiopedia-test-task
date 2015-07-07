require 'rails_helper'

feature 'Excursion' do
  include_context :active_admin

  let(:admin) { create :admin }
  let!(:excursion) { create :excursion_with_categories }

  before do
    admin_authenticate(admin)
  end

  scenario 'Show categories links on index page' do
    visit admin_excursions_path
    expect_categories_links(excursion, "#excursion_#{excursion.id}")
  end

  scenario 'Show categories links on show page' do
    visit admin_excursion_path(excursion)
    expect_categories_links(excursion, '#main_content_wrapper')
  end
end
