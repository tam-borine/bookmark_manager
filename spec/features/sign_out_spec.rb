require 'spec_helper'

feature 'Signing out' do

    scenario 'user signs out' do
      sign_up
      sign_in
      sign_out
      expect(page).to have_content 'Goodbye Santa'
    end
end
