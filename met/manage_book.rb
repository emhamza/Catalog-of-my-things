require_relative '../label'
require_relative '../book'
require 'json'

class BookManager
  attr_accessor :books

  def initialize
    @books = []
    load_data_from_json
  end

  def display_options
    puts ''
    puts 'Welcome to my catalog of books! Please select an option by entering a number:'
    puts '1. Add book'
    puts '2. List all books'
    puts '3. List labels'
    puts '4. Exit'
  end

  def add_book
    puts ''
    puts 'Enter book title: '
    title = gets.chomp

    puts ''
    puts 'Enter publisher: '
    publisher = gets.chomp

    puts ''
    puts 'Enter cover state (good/bad/average): '
    cover_state = gets.chomp.downcase

    puts ''
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date: publish_date)
    label = Label.new(title, cover_state)
    label.add_item(book)
    book.label = label
    @books << book

    save_data_to_json
    puts "Added #{book.title} to your catalog."
  end

  def list_all_books
    if @books.empty?
      puts 'You have no books in your catalog.'
    else
      @books.each do |book|
        puts "Book title: #{book.title}, publisher: #{book.publisher}, cover state: #{book.cover_state}, publish date: #{book.publish_date}"
      end
    end
    load_data_from_json
  end

  def list_labels
    labels = @books.map(&:label).uniq
    if labels.empty?
      puts 'You have no labels in your catalog.'
    else
      labels.each do |label|
        puts "Label title: #{label.title}, color: #{label.color}"
      end
    end
    load_data_from_json
  end

  private

  def save_data_to_json
    File.write('books.json', JSON.pretty_generate(@books.map(&:to_json)))
  end

  def load_data_from_json
    if File.exist?('books.json')
      books_file = File.read('books.json')
      books_data = JSON.parse(books_file)
      @books.clear
      books_data.each do |book|
        @books << Book.from_json(book)
      end
    else
      puts 'No book data file found.'
    end
  end
end
