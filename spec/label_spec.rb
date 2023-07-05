require_relative '../label'
require_relative '../item'

RSpec.describe Label do
  let(:title) { 'Sample Label' }
  let(:color) { 'blue' }
  let(:label) { Label.new(title, color) }

  describe '#add_item' do
    let(:item) { Item.new('2022-01-01') }

    it 'adds the item to the label' do
      label.add_item(item)
      expect(label.items).to include(item)
    end

    it 'sets the label of the item' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end
