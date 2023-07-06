require_relative '../music_album'

RSpec.describe MusicAlbum do
  let(:album) { MusicAlbum.new('The Dark Side of the Moon', nil, on_spotify: true, publish_date: '2010-01-01') }

  describe '#can_be_archived?' do
    context 'when the album is on Spotify' do
      it 'returns true' do
        expect(album.can_be_archived?).to eq(true)
      end
    end

    context 'when the album is not on Spotify' do
      before do
        album.on_spotify = false
      end

      it 'returns false' do
        expect(album.can_be_archived?).to eq(false)
      end
    end
  end
end
