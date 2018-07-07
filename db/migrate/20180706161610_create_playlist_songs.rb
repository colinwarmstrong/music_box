class CreatePlaylistSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :playlist_songs do |t|
      t.references :playlist, foregin_key: true
      t.references :song, foreign_key: true
    end
  end
end
