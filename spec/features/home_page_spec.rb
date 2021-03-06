require 'rails_helper'

RSpec.feature "User navigates to home page", type: :feature, js: true do

  # Setup
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # Act
    visit root_path

    # Debug
    # save_screenshot

    # Verify
    expect(page).to have_css 'article.product', count: 10
  end

end