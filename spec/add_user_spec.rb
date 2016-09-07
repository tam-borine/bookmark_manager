require "spec_helper"

feature 'User accounts' do

  scenario 'add a user account' do
    add_user_with_no_confirm
    fill_in :password_confirmation, with: 'bananas_is_my_password'
    click_button 'Sign up'
    expect(page).to have_content("Welcome, Tam")
    expect(User.first(name: 'Tam').email).to include "@tam"
  end

  scenario 'user try to sign up with mismatching password' do
    add_user_with_no_confirm
    fill_in :password_confirmation, with: 'apple_is_my_password'
    click_button 'Sign up'

    expect(current_path).to eq('/users')
    expect(page).to have_content('Password and confirmation password do not match')
    expect(User.all).to be_empty
  end

  scenario 'user tries to sign up without email address' do
    add_user_with_no_email
    click_button 'Sign up'
    expect(current_path).to eq ('/users')
    expect(User.all).to be_empty
  end

  scenario 'user tries to sign up without email address' do
    add_user_with_no_email
    fill_in :email, with: 'sfsfsfs'
    click_button 'Sign up'
    expect(current_path).to eq ('/users')
    expect(User.all).to be_empty
  end

end
