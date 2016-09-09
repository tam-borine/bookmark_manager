require 'spec_helper'

feature 'registering users' do

  scenario 'sign in a user' do
    sign_up #santa's account
    sign_in #santa's account
    expect(page).to have_content 'Welcome, Santa'
  end

  scenario 'signed in user persists until sign out' do
    sign_up #santa's account
    sign_in #santa's account
    visit '/'
    expect(page).to have_content('Welcome, Santa')
  end

end
