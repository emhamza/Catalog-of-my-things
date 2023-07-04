require_relative '../author'
require_relative '../item'

describe Author do
  describe '#initialize' do
    it 'should create an author' do
      author = Author.new('John', 'Doe')

      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
      expect(author.items).to be_empty
    end
  end

  #   describe '#add_item' do
  #     it 'should add an item to the author' do
  #       author = Author.new('John', 'Doe')
  #       item = Item.new('Some Item')

  #       author.add_item(item)

  #       expect(author.items).to contain_exactly(item)
  #       expect(item.author).to eq(author)
  #     end
  #   end
end
