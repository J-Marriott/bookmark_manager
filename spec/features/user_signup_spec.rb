feature 'User sign up' do
  scenario 'Visitor can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, joe@example.com')
    expect(User.first.email).to eq('joe@example.com')
  end
end