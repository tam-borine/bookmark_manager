require 'spec_helper'

feature 'create tag' do
  scenario 'add tag to a link' do
    visit '/links/new'
    fill_in :title, with: 'psql_woohoo'
    fill_in :url, with: 'https://www.postgresql.org/about/'
    fill_in :tags, with: 'database'
    click_button 'Submit'

    link = Link.first
    expect(link.tags.map(&:name)).to include('database')
  end
end
