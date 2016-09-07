require 'spec_helper'

feature 'creating tags' do

  scenario 'add a single tag to a link' do
    visit '/links/new'
    fill_in('title', with: 'Codecademy')
    fill_in('url', with: 'www.codecademy.com')
    fill_in('tag', with: 'coding')

    click_button('Add Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('coding')
  end
end
