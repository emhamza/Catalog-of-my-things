require 'date'

class Item
  attr_accessor :label, :publish_date, :archived
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = Random.rand(0..1000)
    @publish_date = publish_date
    @archived = archived
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
end
