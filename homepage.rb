require_relative 'app'

def menu(app)
  app.options
  print '>>> :'
  gets.chomp.to_i
end

def manage_selection(app, option)
  tasks = {
    1 => :manage_books,
    2 => :manage_music_albums,
    3 => :manage_games,
    4 => :exit,
    default: :invalid_option
  }

  selected_task = tasks[option] || tasks[:default]
  app.send(selected_task)
end

def homepage(app)
  loop do
    selected_option = menu(app)
    manage_selection(selected_option, app)
    puts "\n"
  end
end
