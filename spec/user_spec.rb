require 'spec_helper'

describe User do
  it 'authenticates a user in the db' do
    User.create(username: 'Santa', email: 'santa@northpole.com', password: '123456', password_confirmation: '123456')
    expect(User.authenticate_user('santa@northpole.com', '123456')).to eq true
  end
end
