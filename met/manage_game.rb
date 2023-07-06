require_relative '../game'
require_relative '../author'
require 'json'

class GameManager
  def initialize
    @games = []
    @authors = []
    load_games_data
  end

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

  def manage_games
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

  def add_game
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

    puts "\Game added successfully!"

    save_games
    save_authors
  end

  def list_all_games
    puts ''
    if @games.empty?
      puts 'No games found!'
    else
      puts 'List of Games:'
      @games.each do |game|
        puts '------------------------------------------------------------'
        # puts "Author: #{game.author.full_name}"
        puts "Last Played Date: #{game.last_played_at}"
        puts "Publish Date: #{game.publish_date}"
        puts '------------------------------------------------------------'
      end
    end
    load_games_data
  end

  def list_all_authors
    puts ''
    if @authors.empty?
      puts 'No authors found!'
    else
      puts 'List of Authors:'
      @authors.each_with_index do |author, index|
        puts "Author #{index + 1}: #{author.first_name}: #{author.last_name}"
      end
    end
    load_games_data
  end

  def save_games
    json = []
    @games.each do |game|
      json << game.to_json
    end
    File.write('data/game.json', JSON.pretty_generate(json))
  end

  def save_authors
    json = []
    @authors.each do |author|
      json << author.to_json

    @authors.each do |_author|
      json << game.to_json
    end
    File.write('data/authors.json', JSON.pretty_generate(json))
  end

  def load_games
    return unless File.exist?('data/games.json')
    return if File.empty?('data/games.json')

    games = JSON.parse(File.read('data/games.json'))
    games.each do |game|
      @games << Game.new(game['last_played_at'], game['publish_date'], multiplayer: game['multiplayer'])
    end
  end

  def load_author
    return unless File.exist?('data/author.json')
    return if File.empty?('data/author.json')

    JSON.parse(File.read('data/authors.json'))
    author.each do |author|
      @author << Author.new(author['first_name'], author['last_name'])
    end
    File.write('data/authors.json', JSON.pretty_generate(json))
  end

  def load_games_data
    load_games
    load_authors
  end
end

