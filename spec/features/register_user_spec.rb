require 'spec_helper'

feature 'registering users' do

  scenario 'sign up a user' do
    expect { sign_up }.to change(User, :count).by(1)
    new_user = User.first
    expect(new_user.email).to eq('santa@northpole.com')
    expect(page).to have_content 'Welcome Santa'
  end

  scenario 'no new users created unless password confirmed' do
    visit '/signup'
    fill_in('username', with: 'Santa')
    fill_in('email', with: 'santa@northpole.com')
    fill_in('password', with: '123456')
    fill_in('password_confirmation', with: '234567')

    expect { click_button 'Sign up' }.to_not change(User, :count)

  end


end
