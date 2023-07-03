require_relative 'app'
require_relative 'homepage'

def main
    app = App.new
    homepage(app)
    end
end

main
