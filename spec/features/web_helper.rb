def post_a_link
  visit 'links/new'
  fill_in :title, with: 'psql_woohoo'
  fill_in :url, with: 'https://www.postgresql.org/about/'
  click_button 'Submit'
end

def create_tagged_links
  Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
  Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
  Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
 end

def post_tagged_link
  visit 'links/new'
  fill_in :title, with: 'psql_woohoo'
  fill_in :url, with: 'https://www.postgresql.org/about/'
  fill_in :tags, with: 'bubbles'
  click_button 'Submit'
end
