require "spec_helper"

feature "Add link" do

  scenario "Add site address and title" do
    add_google_link
    click_button('submit')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('www.google.com')
  end

  scenario "Add tag to link & title" do
    add_google_link
    fill_in('tags', with: 'search engine')

    click_button('submit')
    link = Link.first
    expect(page.status_code).to eq(200)
    expect(link.tags.map(&:name)).to include('search engine')
  end

  scenario "Add more tags to the link" do
    add_google_link
    fill_in('tags', with: "search engine, corporate, popular, google")
    click_button('submit')
    add_cnn_link
    fill_in('tags', with: "news, corporate, cnn")
    click_button('submit')
    visit('/tags/popular')
    expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).to have_content("Google")
      expect(page).not_to have_content("CNN")
    end
  end
end
