require 'rails_helper'

RSpec.feature "Visitor can navigate to a product page from the home page", type: :feature, js: true do

  # SETUP

  before :each do

    @category = Category.create! name: 'Apparel'

    @category.products.create!(
          name: "The Only Product",
          description: "This is the description for the only product on the page",
          quantity: 10,
          image: open_asset('apparel2.jpg'),
          price: 64.99
    )

  end

  scenario "They start from the homepage" do
    # ACT
    visit root_path
    click_on "Details »"

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_current_path '/products/1'
  end

end