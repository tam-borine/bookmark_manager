require 'spec_helper'

feature 'creating tags' do

  scenario 'add a single tag to a link' do
    add_link_no_submit
    fill_in('tag', with: 'coding')
    click_button('Add Link')
  end
end
