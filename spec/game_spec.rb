require_relative '../game'

require_relative 'game'

describe Game do
  describe '#initialize' do
    it 'should create a game' do
      game = Game.new(true, '10-10-2010', '20-08-2009', false)

      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq('10-10-2010')
      expect(game.publish_date).to eq('20-08-2009')
      expect(game.archived).to eq(false)
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if the game can be archived' do
      game1 = Game.new(true, '10-10-2010', '20-08-2009', false)
      expect(game1.can_be_archived?).to eq(true)

      game2 = Game.new(true, '10-10-2019', '20-08-2009', false)
      expect(game2.can_be_archived?).to eq(false)

      game3 = Game.new(true, '10-10-2010', '20-08-2009', true)
      expect(game3.can_be_archived?).to eq(false)
    end
  end
end
