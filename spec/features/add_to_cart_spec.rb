require 'rails_helper'

RSpec.feature "Visitor adds product to cart from home page", type: :feature, js: true do

  # SETUP

  before :each do

    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          quantity: 10,
          image: open_asset('apparel1.jpg'),
          price: 64.99
        )
    end

  end

  scenario "They see all products" do
    # ACT
    visit root_path

    click_on("Add", match: :first)

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content 'My Cart (0)'
  end

end