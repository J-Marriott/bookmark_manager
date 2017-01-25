feature 'sign up to website' do
  scenario 'User can sign up to website' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'bookmarks'
    # expect(page).to have_content 'Welcome'
    expect(page).to have_content 'Welcome mememe@not_a_url.com'
  end
end
