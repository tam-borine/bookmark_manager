require 'spec_helper'

feature 'registering users' do

  scenario 'sign in a user' do
    sign_up
    sign_in
    expect(page).to have_content 'Welcome, Santa'
  end

end
