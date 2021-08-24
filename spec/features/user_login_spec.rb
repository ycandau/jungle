require 'rails_helper'

RSpec.feature "User logs in", type: :feature, js: true do

  # Setup
  before :each do
    User.create!(
      first_name: 'Fred',
      last_name: 'Frum',
      email: 'ffrum@gmail.com',
      password: 'sempervirens',
      password_confirmation: 'sempervirens'
    )
  end

  scenario "The user is logged in" do

    visit login_path

    expect(page).to have_no_css('section.products-index')

    fill_in 'email', with: 'ffrum@gmail.com'
    fill_in 'password', with: 'sempervirens'
    find('form input.btn-primary', match: :first).click
    
    expect(page).to have_css('section.products-index')
    expect(page).to have_content('Signed in as Fred')

  end

end