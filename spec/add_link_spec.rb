require "spec_helper"

feature "Add link" do

  scenario "Add site address and title" do
    visit '/links/new'
    fill_in('title', with: 'Google')
    fill_in('url', with: 'www.google.com')
    click_button('submit')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('www.google.com')
  end

end
