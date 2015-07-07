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

  def access_success_for_page(name, path)
    expect(find('#tabs')).to have_content(name)
    click_link name
    expect(page.current_path).to eq(path)
  end

  def access_denied_for_page(name, path)
    expect(find('#tabs')).to have_no_content(name)
    visit path
    expect(page.current_path).to eq(root_path)
  end

  def expect_categories_links(excursion, selector)
    excursion.category_excursions.each do |category|
      expect(find(selector)).to have_link(category.name, href: admin_category_excursion_path(category))
    end
  end

end
