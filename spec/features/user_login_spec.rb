require 'rails_helper'

RSpec.feature "User can login from login page", type: :feature, js: true do

  # SETUP

  before :each do

    @user = User.create!(name: 'Test',
                         password: 'password',
                         password_confirmation: 'password',
                         email: 'test@email.com')

  end


  scenario "They access the login page" do

    # ACT
    visit "/login"

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'Submit'

    # DEBUG
    save_screenshot

    # VALIDATIONS
    expect(page).to have_content 'Logout'

  end

end
