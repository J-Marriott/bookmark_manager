feature 'user can assign a tag to a bookmark' do
  scenario 'user creates a new link with a tag' do
    new_link
    within 'ul#links' do
      expect(page).to have_content('Best')
    end
  end
end

feature 'user can assign multiple tags to a bookmark' do
  scenario 'user creates a new link with multiple tags' do
    new_link_multiple_tags
    link = Link.first
    expect(link.tags.map(&:name)).to include 'search', 'gmail'
  end
end
