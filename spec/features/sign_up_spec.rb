feature 'sign up to website' do
  scenario 'User can sign up to website' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'bookmarks'
    expect(page).to have_content 'Welcome, mememe@not_a_url.com'
  end
end

feature 'password verification' do
  scenario 'It checks two passwords to see if they match' do
    # visit '/users/new'
    # fill_in 'email', with: 'mememe@not_a_url.com'
    # fill_in 'password', with: 'worldsbestpassword'
    # fill_in 'password_check', with: 'nottheworldsbestpassword'
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end

feature 'email content' do
  scenario 'It checks that the email field isn\'t blank' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
  end
end
