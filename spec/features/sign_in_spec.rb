require 'spec_helper'

feature 'user sign in and authentication' do

  scenario 'user signs in' do
    sign_in
    expect(current_user.email).to eq('erce@erce.com')
    expect(page).to have_content 'Welcome, Erce'
    end

  end
