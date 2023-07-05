require_relative '../game'
require_relative '../author'

class GameManager
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def start
    loop do
      puts ''
      print_options.call
      option = gets.chomp.to_i
      case option
      when 1
        list_all_games.call
      when 2
        list_all_authors.call
      when 3
        add_game.call
      when 4
        break
      else
        puts 'Invalid option. Please enter the number of the option to proceed.'
      end
    end
  end

  private

  def print_options
    lambda {
      puts 'Please select an option by entering a number:'
      puts '1. List all games'
      puts '2. List all authors'
      puts '3. Add a game'
      puts '4. Exit'
      print '>>> '
    }
  end

  def add_game
    lambda {
      puts ''
      print 'Enter author first name: '
      first_name = gets.chomp
      print 'Enter author last name: '
      last_name = gets.chomp
      print 'Is the game multiplayer? (Y/N): '
      is_multiplayer = gets.chomp.downcase == 'y'
      print 'Enter last played date (DD/MM/YYYY): '
      last_played_at = gets.chomp
      print 'Enter date of publish (DD/MM/YYYY): '
      publish_date = gets.chomp

      game = Game.new(is_multiplayer, last_played_at, publish_date, archived: false)
      author = Author.new(first_name, last_name)
      author.add_item(game)

      @games << game
      @authors << author

      puts "\nGame added successfully!"
    }
  end

  def list_all_games
    lambda {
      puts ''
      if @games.empty?
        puts 'No games found!'
      else
        puts 'List of Games:'
        @games.each do |game|
          puts '------------------------------------------------------------'
          puts "Author: #{game.author.full_name}"
          puts "Last Played Date: #{game.last_played_at}"
          puts "Publish Date: #{game.publish_date}"
          puts '------------------------------------------------------------'
        end
      end
    }
  end

  def list_all_authors
    lambda {
      puts ''
      if @authors.empty?
        puts 'No authors found!'
      else
        puts 'List of Authors:'
        authors.each_with_index do |author, index|
          puts "Author #{index + 1}: #{author.full_name}"
        end
      end
    }
  end
end
