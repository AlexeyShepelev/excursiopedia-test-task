shared_context :active_admin do

  def admin_authenticate user
    visit '/admin'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Login'

    expect(page).to have_content('Signed in successfully.')
  end

  def visit_user_edit_admin_page user
    click_link 'Users'
    find("#user_#{user.id} a.edit_link").click
  end

end
