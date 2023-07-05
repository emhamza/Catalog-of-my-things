require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date: nil, archived: false)
    super(publish_date: publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
