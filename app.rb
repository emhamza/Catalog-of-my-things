require_relative 'met/manage_book'
require_relative 'met/manage_game'
require_relative 'met/manage_music_album'

class App
  attr_accessor :books, :games, :music

  def initialize
    @books = BookManager.new
    @games = GameManager.new
    @music_albums = MusicManager.new
  end

  def load_data
    puts 'Loading >>>>>'
    load_games_data
  end

  def options
    puts ''
    puts 'Welcome to my catalog of things! Please select an option by entering a number:'
    puts '1. Manage Books'
    puts '2. Manage Music Albums'
    puts '3. Manage Games'
    puts '4. Exit'
  end

  # def start
  #   loop do
  #     puts ''
  #     options
  #     option = gets.chomp.to_i
  #     case option
  #     when 1
  #       @books_manager.BookManager
  #     when 2
  #       @games_manager.GameManager
  #     when 3
  #       @music_albums_manager.MusicManager
  #     when 4
  #       break
  #     else
  #       invalid_option
  #     end
  #   end
  # end
end
