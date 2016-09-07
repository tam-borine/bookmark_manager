require "spec_helper"

feature "Viewing Links" do

  scenario "I can see existing links on the web page" do
    Link.create(url: 'http://makersacademy.com', title: "Makers Academy")

    visit "/links"

    expect(page.status_code).to eq(200)

    within "ul#links" do
      expect(page).to have_content("Makers Academy")
    end
  end
end
