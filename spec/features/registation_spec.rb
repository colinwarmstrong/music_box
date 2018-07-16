require 'rails_helper'

describe 'registration workflow' do
  it 'submits registration form successfully' do
    username = 'pumped_to_be_here'

    visit '/'

    click_on 'Sign Up to be a New User'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: '12345'

    click_on 'Create User'

    expect(current_path).to eq(user_path(User.last))

    expect(page).to have_content("Welcome, #{username}")
  end
end