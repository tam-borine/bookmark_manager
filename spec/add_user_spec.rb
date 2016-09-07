require "spec_helper"

feature 'User accounts' do

  scenario 'add a user account' do
    visit '/users/new'
    fill_in :name, with: 'Tam'
    fill_in :email, with: 'tam@tam.com'
    fill_in :password, with: 'bananas_is_my_password'
    click_button 'Sign up'
    expect(page).to have_content("Welcome Tam")
    expect(User.first(name: 'Tam').email).to include "@tam"
  end

end
