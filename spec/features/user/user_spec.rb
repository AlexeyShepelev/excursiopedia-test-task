require 'rails_helper'

feature 'User' do
  let(:user) { create :user }

  scenario 'Access denied to admin panel' do
    visit '/admin'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Login'

    expect(page.current_path).to eq(root_path)

    visit '/admin'
    expect(page.current_path).to eq(root_path)
  end
end
