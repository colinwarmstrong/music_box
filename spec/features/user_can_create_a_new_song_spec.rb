require 'rails_helper'

describe 'User can create a new song' do
  it 'by filling out a form' do
    user = User.create(username: 'test', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    artist = Artist.create(name: 'Wild Cherry')
    song_title = 'Play That Funky Music'
    song_length = 267
    song_play_count = 340000

    visit new_artist_song_path(artist)

    fill_in :song_title, with: song_title
    fill_in :song_length, with: song_length
    fill_in :song_play_count, with: song_play_count
    click_on 'Create Song'

    expect(current_path).to eq(songs_path)
    expect(page).to have_content(song_title)
  end
end
