require 'spec_helper'

feature 'registering users' do

  scenario 'sign up a user' do
    # User.create(username: 'Erce', email: 'erce@erce.com', password: '123456')
    # visit '/sign-up'

    expect { sign_up }.to change(User, :count).by(1)
    new_user = User.first
    expect(new_user.email).to eq('erce@erce.com')
    expect(page).to have_current_path('/welcome') 
    expect(page).to have_content 'Welcome Erce'
    end
  end
