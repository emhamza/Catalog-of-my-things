require_relative 'met/manage_book'
require_relative 'met/manage_game'
require_relative 'met/manage_music_album'

class App
  attr_accessor :books, :music_albums, :games

  def initialize
    @books = []
    @music_albums = []
    @games = []
  end

  def options
    puts ''
    puts 'Welcome to my catalog of things! Please select an option by entering a number:'
    puts '1. Manage Books'
    puts '2. Manage Music Albums'
    puts '3. Manage Games'
    puts '4. Exit'
  end

  def invalid_option; end
end