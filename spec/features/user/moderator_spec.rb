require 'rails_helper'

feature 'Moderator' do
  include_context :active_admin

  let(:moderator) { create :moderator }

  scenario "Can't manage users" do
    admin_authenticate(moderator)

    expect(all('#users a').count).to eq(0)

    visit '/admin/users'
    expect(page.current_path).to eq(root_path)
  end
end
