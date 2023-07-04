class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color)
    @id = rand(0...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
