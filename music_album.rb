require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify, :genre

  def initialize(name, genre, on_spotify: false, publish_date: nil, archived: false)
    super(publish_date: publish_date, archived: archived)
    @name = name
    @on_spotify = on_spotify
    @genre = genre
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_hash
    {
      name: @name,
      genre_name: @genre,
      on_spotify: @on_spotify,
      publish_date: @publish_date,
      archived: @archived
    }
  end

  def self.from_hash(hash)
    self.new(
      hash['name'],
      hash['genre_name'],
      on_spotify: hash['on_spotify'],
      publish_date: hash['publish_date'],
      archived: hash['archived']
    )
  end
end
