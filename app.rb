require_relative 'met/manage_book'
require_relative 'met/manage_game'
require_relative 'met/manage_music_album'

class App
  attr_accessor :books, :games, :music

  def initialize
    @books = BookManager.new
    @music_albums = MusicManager.new
    @games = GameManager.new
  end

  def list_options
    puts '1. List all books.'
    puts '2. List all labels (e.g. Gift, New).'
    puts '3. Add a book.'
    puts '4. List all music albums.'
    puts '5. List all genres (e.g Comedy, Thriller).'
    puts '6. Add a music album.'
    puts '7. Add a game.'
    puts '8. List all games.'
    puts '9. List all authors (e.g. Stephen King).'
    puts '10. Quit'
  end

  def manage_books(test)
    case test
    when 1
      @books.list_all_books
    when 2
      @books.list_labels
    when 3
      @books.add_book
    end
  end

  def manage_music_albums(test)
    case test
    when 4
      puts 'Listing all music albums...'
      @music_albums.list_all_music_albums
    when 5
      puts 'Listing all genres...'
      @music_albums.list_genres
    when 6
      puts 'Adding a music album...'
      @music_albums.add_music_album
    end
  end

  def manage_games(test)
    case test
    when 7
      @games.add_game
    when 8
      @games.list_all_games
    when 9
      @games.list_all_authors
    end
  end

  def run
    puts "Welcome to my Catalog of things!\n\n"

    loop do
      puts list_options
      option = gets.chomp.to_i

      case option
      when 1..3
        manage_books(option)
      when 4..6
        manage_music_albums(option)
      when 7..9
        manage_games(option)
      when 10
        puts 'Exiting the Catalog of My Things app...'
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end
end
