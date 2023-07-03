def menu(_app)
  @app.options
  print '>>> :'
  gets.chomp.to_i
end

def manage_selection(options, app)
  tasks = {
    1 => :manage_books,
    2 => :manage_music_albums,
    3 => :manage_games,
    4 => :exit,
    default: :invalid_option
  }

  selection = tasks[options] || tasks[:default]
  app.send(selection)
end

def homepage(app)
  loop do
    app = menu(app)
    manage_selection(options, app)
    puts "\n"
  end
end
