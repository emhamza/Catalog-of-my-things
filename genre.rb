require_relative 'music_album'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = Random.rand(0...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
