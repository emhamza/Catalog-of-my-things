require 'date'

class Item
  attr_accessor :label, :publish_date, :archived, :author, :genre
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = Random.rand(0..1000)
    @publish_date = publish_date
    @archived = archived
    @author = author
    @label = []
  end

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end
end
