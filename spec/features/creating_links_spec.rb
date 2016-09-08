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

  scenario 'adding a single tag to a link' do
    visit '/links/new'
    fill_in('title', with: 'Codecademy')
    fill_in('url', with: 'www.codecademy.com')
    fill_in('tag', with: 'coding')

    click_button('Add Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding')
  end

  scenario 'adding multiple tags to a link' do
    add_multiple_tags
    visit '/tags/internet'
    within 'ul#links' do
      expect(page).to have_content('Codecademy')
      expect(page).to have_content('Google')
      expect(page).not_to have_content('Boogle')
    end
  end

end
