require_relative '../genre'

RSpec.describe Genre do
  let(:genre) { Genre.new('Rock') }
  let(:album) { MusicAlbum.new('The Dark Side of the Moon', nil, on_spotify: true, publish_date: '2010-01-01') }

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre.add_item(album)
      expect(genre.items).to include(album)
    end
  end
end
