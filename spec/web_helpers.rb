def add_google_link
  visit '/links/new'
  fill_in('title', with: 'Google')
  fill_in('url', with: 'www.google.com')
end

def add_cnn_link
  visit '/links/new'
  fill_in('title', with: 'CNN')
  fill_in('url', with: "www.cnn.com")
end

def add_user_with_no_confirm
  visit '/users/new'
  fill_in :name, with: 'Tam'
  fill_in :email, with: 'tam@tam.com'
  fill_in :password, with: 'bananas_is_my_password'
end

def add_user_with_no_email
  visit '/users/new'
  fill_in :name, with: 'Tam'
  fill_in :password, with: 'bananas_is_my_password'
  fill_in :password_confirmation, with: 'bananas_is_my_password'
end
