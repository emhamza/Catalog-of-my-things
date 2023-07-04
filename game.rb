require_relative 'item'

class Game < item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, archived)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_achieved?()
    is_expired = Time.now.year - Date.parse(@last_played_at).year > 2
    super and is_expired ? true : false
  end
end
