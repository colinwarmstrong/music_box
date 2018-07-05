require 'rails_helper'

describe 'user index' do
  it 'user can see all songs' do
    song_1 = Song.create(title: "Don't Stop Believin", length: 303, play_count: 123456)
    song_2 = Song.create(title: "Never Gonna Give You Up", length: 253, play_count: 98762452)

    visit songs_path

    expect(page).to have_content('All Songs')
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    
    expect(page).to have_content("Plays: #{song_1.play_count}")
    expect(page).to have_content("Plays: #{song_2.play_count}")
  end
end
