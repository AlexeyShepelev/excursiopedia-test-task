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

  scenario 'Show object versions' do
    excursion.update_attributes!(title: 'new title')
    excursion.update_attributes!(description: 'new description')

    visit admin_excursion_path(excursion)

    excursion.versions.each do |version|
      row = find("#paper_trail_version_#{version.id}")

      expect(row).to have_content(version.event)
      expect(row).to have_content(version.changeset)
      expect(row).to have_content(I18n.l(version.created_at))
      expect(row).to send(version.whodunnit ? :have_content : :have_no_content, admin.email)
    end
  end
end
