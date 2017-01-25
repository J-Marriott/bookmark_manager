def new_link(hash = {})
  visit './links/new'
  fill_in 'url', with:   (hash[:url] || 'thing.com')
  fill_in 'title', with: (hash[:title] || 'thingie')
  fill_in 'tags', with:  (hash[:tags] || 'Best thing')
  click_button 'add link'
end

def new_link_multiple_tags(hash = {})
  visit './links/new'
  fill_in 'url', with:   (hash[:url] || 'google.com')
  fill_in 'title', with: (hash[:title] || 'Google')
  fill_in 'tags', with:  (hash[:tags] || 'search gmail')
  click_button 'add link'
end

def sign_up
  visit '/sign_up'
  fill_in 'email', with: 'mememe@not_a_url.com'
  fill_in 'password', with: 'worldsbestpassword'
  click_button 'submit'
end
