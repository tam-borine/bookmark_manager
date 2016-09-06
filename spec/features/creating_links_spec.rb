require 'spec_helper'

feature 'create links' do
  scenario 'create link' do
    visit '/links/new'
    fill_in :title, with: 'psql_woohoo'
    fill_in :url, with: 'https://www.postgresql.org/about/'
    click_button 'Submit'
    expect(page).to have_content('psql_woohoo')
  end
end
