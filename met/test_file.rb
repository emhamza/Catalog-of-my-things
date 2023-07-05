require_relative 'manage_book'

manage_book = BookManager.new

loop do
  manage_book.display_options
  option = gets.chomp.to_i

  case option
  when 1
    manage_book.add_book
  when 2
    manage_book.list_all_books
  when 3
    manage_book.list_labels
  when 4
    break
  else
    puts 'Invalid option. Please try again.'
  end
end
