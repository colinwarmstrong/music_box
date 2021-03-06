require 'rails_helper'

describe 'Login workflow' do
  it 'allows registered user to login successfully' do
    user = User.create(username: 'Keegan', password: 'test')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'Login'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content('Logout')
    expect(page).to_not have_content('I already have an account')
  end

  it 'allows registered users to logout' do
    user = User.create(username: 'Keegan', password: 'test')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'Login'
    click_on 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('I already have an account')
  end
end
