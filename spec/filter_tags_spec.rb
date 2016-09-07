require 'spec_helper'

feature 'Filter tags' do
  scenario 'filter for links tagged with bubbles' do

    1.upto(5) do |n|
      visit 'links/new'
      fill_in('title', with: "Big Bubble#{n}")
      fill_in('url', with: "www.bigbubble#{n}.com")
      fill_in('tags', with: 'bubbles')
      click_button('submit')
    end
    visit '/tags/bubbles'
    expect(page).to have_content('Big Bubble1')
    expect(page).to have_content('Big Bubble2')
    expect(page).to have_content('Big Bubble3')
    expect(page).to have_content('Big Bubble4')
    expect(page).to have_content('Big Bubble5')
  end
end
