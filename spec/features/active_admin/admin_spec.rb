require 'rails_helper'

feature 'Admin' do
  include_context :active_admin

  let(:admin) { create :admin }
  let(:user_attrs) { attributes_for :user }
  let!(:user) { create :user }

  before do
    admin_authenticate(admin)
  end

  scenario "Can't create new user without password" do
    click_link 'Users'
    click_link 'New User'

    fill_in 'user_email', with: user_attrs[:email]
    click_button 'Create User'

    expect(page).to have_content("can't be blank")
    expect(page).to have_no_content('User was successfully updated.')
  end

  scenario 'Update user without password' do
    visit_user_edit_admin_page(user)

    find('#user_role').find("option[value='#{UserRole::MODERATOR}']").select_option
    click_button 'Update User'

    expect(page).to have_content('User was successfully updated.')
    expect(find('.row-role td').text).to eq(UserRole::MODERATOR.to_s)
  end

  scenario 'Update user password' do
    visit_user_edit_admin_page(user)

    fill_in 'user_password', with: user_attrs[:password]
    fill_in 'user_password_confirmation', with: user_attrs[:password_confirmation]
    click_button 'Update User'

    expect(page).to have_content('User was successfully updated.')
  end
end
