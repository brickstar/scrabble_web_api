require 'rails_helper'

describe 'guest user visits /' do
  context 'it fills in text box with foxes' do
    it 'should see a message: foxes is a valid word and root form is fox' do
      # As a guest user (no sign in necessary)
      # When I visit “/”
      visit '/'
      # And I fill in a text box with “foxes”
      fill_in :search, with: "foxes"
      click_on "Validate Word"
      # And I click “Validate Word”
      expect(page).to have_content("‘foxes’ is a valid word and its root form is ‘fox’.")
      # Then I should see a message that says “‘foxes’ is a valid word and its root form is ‘fox’.”
    end
  end
  # As a guest user
  # When I visit “/”
  # And I fill in a text box with “foxez”
  # And I click “Validate Word”
  # Then I should see a message that says “‘foxez’ is not a valid word.”
end
