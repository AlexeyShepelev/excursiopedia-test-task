require 'rails_helper'

feature 'Filling Excursion' do
  include_context :active_admin

  let(:moderator) { create :moderator }
  let!(:excursions) { create_list(:undescribed_excursion, 5) }
  let!(:unpublished_excursions) { create_list(:undescribed_unpublished_excursion, 2) }

  before do
    admin_authenticate(moderator)
    visit admin_filling_excursions_path
  end

  scenario "Don't have cancel link" do
    expect(page).to have_no_link('Cancel', href: admin_filling_excursions_path)
  end

  scenario 'Filling excursions usage' do
    (excursions + unpublished_excursions).each do |excursion|
      expect(page).to have_selector("form[action='#{admin_filling_excursion_path(excursion)}']")

      fill_in 'excursion_description', with: 'Description'
      click_button 'Update Excursion'
    end
    expect(page).to have_content(I18n.t('active_admin.filling_excursions.message'))
  end
end
