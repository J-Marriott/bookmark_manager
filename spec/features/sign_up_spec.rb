feature 'sign up to website' do
  scenario 'User can sign up to website' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'bookmarks'
    expect(page).to have_content 'Welcome, mememe@not_a_url.com'
  end
end

feature 'password verification' do
  scenario 'It checks two passwords to see if they match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end

feature 'email content' do
  scenario 'It checks that the email field isn\'t blank' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'User can\'t sign up with an invalid email' do
    expect { sign_up(email: 'invalid@email.com').not_to change(User, :count) }
  end

  scenario 'User can\'t sign up if email address has already been used' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
