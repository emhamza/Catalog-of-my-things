require_relative 'label'
require 'json'

class Book
  attr_accessor :publisher, :cover_state, :publish_date
  attr_reader :id, :title, :label

  def initialize(title, publisher, cover_state: 'good', publish_date: nil)
    @id = rand(0...1000)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @label = nil
  end

  def label=(label)
    @label = label
  end

  def can_be_archived?
    @cover_state == 'bad'
  end

  def to_json
    {
      id: @id,
      title: @title,
      publisher: @publisher,
      cover_state: @cover_state,
      publish_date: @publish_date
    }.to_json
  end

  def self.from_json(json_data)
    data = JSON.parse(json_data)
    new(
      data['title'],
      data['publisher'],
      cover_state: data['cover_state'],
      publish_date: data['publish_date']
    )
  end
end
