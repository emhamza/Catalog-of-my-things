require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify, :genre

  def initialize(name, genre, on_spotify: false, publish_date: nil, archived: false)
    super(publish_date, archived: archived)
    @name = name
    @genre = genre
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*_args)
    {
      'name' => @name,
      'genre' => @genre.name,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    MusicAlbum.new(data['name'], Genre.new(data['genre']),
                   on_spotify: data['on_spotify'],
                   publish_date: data['publish_date'])
  end
end
