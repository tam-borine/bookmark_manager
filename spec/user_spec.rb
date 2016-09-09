require 'spec_helper'

describe User do
  it 'authenticates a user in the db' do
    sign_up
    sign_in
    expect(authenticate_user).to eq true
  end
end
