require 'rails_helper'

RSpec.feature "User can login from login page", type: :feature, js: true do


  scenario "They access the login page" do

    # ACT
    visit "/login"

    # DEBUG
    screen_shot

  end

end
