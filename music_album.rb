require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify

  def initialize(name, on_spotify: false, publish_date: nil, archived: false)
    super(publish_date: publish_date, archived: archived)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
