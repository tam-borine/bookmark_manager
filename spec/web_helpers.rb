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
