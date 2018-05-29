require 'rails_helper'

RSpec.feature "Visitor clicks on product from homepage", type: :feature, js: true do

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
    click_link 'Details'
    visit product_path(1)

    save_screenshot

    expect(page).to have_css 'section.products-show', count: 1
  end
end
