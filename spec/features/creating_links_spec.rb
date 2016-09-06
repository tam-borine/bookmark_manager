require 'spec_helper'

feature 'creating links' do
  scenario 'when submitting a form' do
    visit '/links/new'
    fill_in('title', with: 'Codecademy')
    fill_in('url', with: 'www.codecademy.com')
    click_button('Add Link')

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Codecademy')
    end
  end
end
