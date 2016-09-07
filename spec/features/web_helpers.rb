
  def add_multiple_tags
    visit '/links/new'
    fill_in('title', with: 'Codecademy')
    fill_in('url', with: 'www.codecademy.com')
    fill_in('tag', with: 'coding internet')
    click_button('Add Link')
    visit '/links/new'
    fill_in('title', with: 'Google')
    fill_in('url', with: 'www.google.com')
    fill_in('tag', with: 'internet search')
    click_button('Add Link')
    visit '/links/new'
    fill_in('title', with: 'Boogle')
    fill_in('url', with: 'www.boogle.com')
    fill_in('tag', with: 'sport fun')
    click_button('Add Link')
  end

  def sign_up
    visit '/signup'
    fill_in('username', with: 'Erce')
    fill_in('email', with: 'erce@erce.com')
    fill_in('password', with: '123456')
    click_button 'Sign up'
  end
