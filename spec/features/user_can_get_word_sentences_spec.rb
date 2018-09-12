require 'rails_helper'

describe 'guest user visits /' do
  context 'and fills in text box with foxes' do
    it 'should see a message: foxes is a valid word and root form is fox' do
      visit '/'

      fill_in :search, with: "foxes"

      click_on "Validate Word"

      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'")
    end
  end

  context 'and fills in text box with foxez' do
    it 'should see a message: foxes is not a valid word.' do
      visit '/'

      fill_in :search, with: "foxez"

      click_on "Validate Word"
      expect(page).to have_content("'foxez' is not a valid word.")
    end
  end
end
