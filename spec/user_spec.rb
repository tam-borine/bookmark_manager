require 'spec_helper'

describe User do

  let!(:user) { User.create(username: 'Santa', email: 'santa@northpole.com', password: '123456', password_confirmation: '123456')
    }

  it 'authenticates a user in the db' do
    expect(User.authenticate_user('santa@northpole.com', '123456')).to eq user
  end

  it 'does not authenticate a non existent user' do
    expect{User.authenticate_user('crap@fake.com', '123456')}.to raise_error "email or password incorrect"
  end

  it 'does not authenticate a user when password is wrong' do
    expect(User.authenticate_user('santa@northpole.com', '12888')).not_to eq user
  end
end
