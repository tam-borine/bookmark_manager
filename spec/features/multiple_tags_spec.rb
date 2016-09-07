require 'spec_helper'

feature 'add multiple tags and check' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education internet')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search internet')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    end

  scenario 'we add two tags and check they are present' do
      visit '/tags/internet'

      expect(page.status_code).to eq(200)
      within 'ul#links' do
        expect(page).to have_content('Makers Academy')
        expect(page).to have_content('Google')
        expect(page).not_to have_content('Bubble')
      end
    end
end
