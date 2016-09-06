require 'spec_helper'

feature 'filter links by tag' do

  before do
    create_tagged_links
  end

  scenario 'filters list of links by a tag' do

    visit '/tags/bubbles'
    expect(page.status_code).to eq 200

    within 'ul#links' do
         expect(page).not_to have_content('Makers Academy')
         expect(page).not_to have_content('Code.org')
         expect(page).to have_content('This is Zombocom')
         expect(page).to have_content('Bubble Bobble')
       end

    end
end
