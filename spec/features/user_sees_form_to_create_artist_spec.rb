require 'rails_helper'

describe 'user can create artists' do
  it 'by filling in a form' do
    artist_name = 'Journey'

    visit new_artist_path

    fill_in :artist_name, with: artist_name

    click_on 'Create Artist'

    expect(page).to have_content(artist_name)
  end
end
