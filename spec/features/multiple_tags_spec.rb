require 'spec_helper'

feature 'add multiple tags and check' do

  before(:each) do
    add_multiple_tags
    end

  scenario 'we add two tags and check they are present' do
      visit '/tags/internet'

      expect(page.status_code).to eq(200)
      within 'ul#links' do
        expect(page).to have_content('Codecademy')
        expect(page).to have_content('Google')
        expect(page).not_to have_content('Boogle')
      end
    end
end
