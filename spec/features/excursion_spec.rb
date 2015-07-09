require 'rails_helper'

feature 'Excursion' do

  describe 'Visit excursion page' do
    let(:excursion) { create(:excursion_with_categories) }

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

  describe 'Use browsing history', :js do
    let(:excursions) { create_list(:excursion_with_categories, 5) }

    before do
      excursions.each do |excursion|
        visit excursion_path(excursion)
      end
    end

    scenario 'Show only three items sorted by FIFO' do
      all('.nav-list li').each_with_index do |li, i|
        excursion = excursions[i]
        expect(li).to have_link(excursion.title, excursion_path(excursion))
      end

      excursions[3..4].each do |excursion|
        expect(page).to have_no_link(excursion.title, excursion_path(excursion))
      end
    end

    scenario "Don't show current excursion in list" do
      excursion = excursions[0]
      visit excursion_path(excursion)
      expect(page).to have_no_link(excursion.title, excursion_path(excursion))
    end

    scenario 'Remove item from history list' do
      visit excursion_path(excursions[0])

      excursion = excursions[1]
      expect(page).to have_link(excursion.title, excursion_path(excursion))

      find_by_id(excursion.id).click
      expect(page).to have_no_link(excursion.title, excursion_path(excursion))

      visit current_path
      expect(page).to have_no_link(excursion.title, excursion_path(excursion))
    end
  end
end
