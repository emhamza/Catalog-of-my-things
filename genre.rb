require_relative 'item'

class Genre < Item
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    super(publish_date, archived: false)
    @id = Random.rand(0...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
