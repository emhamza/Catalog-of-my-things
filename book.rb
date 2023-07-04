class Book < Item
    attr_accessor :publisher, :cover_state
  
    def initialize(id = rand, publish_date, archived, label, publisher, cover_state)
      super(id, publish_date, archived, label)
      @publisher = publisher
      @cover_state = cover_state
    end
  
    def can_be_archived?
    end
  end
  