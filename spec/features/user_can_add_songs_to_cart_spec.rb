require 'rails_helper'

describe "An unregistered visits '/songs'" do
  it "add a song to their cart" do
    artist = Artist.create(name: 'Nickleback')
    song = artist.songs.create!(title: 'Hey Ya', length: 250, play_count: 12)
    user = User.create!(username: 'test', password: '1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit songs_path

    click_on 'Add to Cart'

    expect(page).to have_content('Added Song to Cart')

    click_on 'View Cart'

    expect(current_path).to eq(user_cart_path(user))
    expect(page).to have_content(song.title)
  end
end
