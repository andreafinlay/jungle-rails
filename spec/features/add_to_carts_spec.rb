require 'rails_helper'

RSpec.feature "Visitor clicks on add to cart button", type: :feature, js: true do

  before :each do
  @category = Category.create! name: 'Apparel'

  1.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end

  scenario "They are redirected to the product details page" do
    visit root_path
    click_link 'Add'
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end

  end
