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
