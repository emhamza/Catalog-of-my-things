require_relative '../genre'
require_relative '../music_album'

class MusicManager
  attr_accessor :albums

  def initialize
    @albums = []
  end

  def display_options
    puts ''
    puts 'Welcome to my catalog of music albums! Please select an option by entering a number:'
    puts '1. Add music album'
    puts '2. List all music albums'
    puts '3. List genres'
    puts '4. Exit'
  end

  def add_music_album
    puts ''
    puts 'Enter album title: '
    title = gets.chomp

    puts ''
    puts 'Is it on Spotify? (y/n)'
    on_spotify = gets.chomp.downcase == 'y'

    puts ''
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    puts ''
    puts 'Enter genre: '
    genre_name = gets.chomp.downcase

    album = MusicAlbum.new(title, genre_name, on_spotify: on_spotify, publish_date: publish_date)
    genre = Genre.new(genre_name)
    genre.add_item(album)
    album.genre = genre
    @albums << album

    puts "Added #{album.name} to your catalog."
  end

  def list_all_music_albums
    if @albums.empty?
      puts 'You have no music albums in your catalog.'
    else
      @albums.each do |album|
        puts "Album title: #{album.name}, on Spotify: #{album.on_spotify}, publish date: #{album.publish_date}"
      end
    end
  end

  def list_genres
    genres = @albums.map(&:genre).uniq
    if genres.empty?
      puts 'You have no genres in your catalog.'
    else
      genres.each do |genre|
        puts "Genre: #{genre.name}"
        genre.items.each do |item|
          puts "Album title: #{item.name}, on Spotify: #{item.on_spotify}, publish date: #{item.publish_date}"
        end
      end
    end
  end
end
