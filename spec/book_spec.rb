require_relative '../book'

RSpec.describe Book do
  let(:publish_date) { '2022-01-01' }
  let(:publisher) { 'Sample Publisher' }
  let(:book) { Book.new(publish_date, publisher) }

  describe '#can_be_archived?' do
    context 'when the cover state is good' do
      it 'returns false' do
        expect(book.can_be_archived?).to be_falsey
      end
    end

    context 'when the cover state is bad' do
      it 'returns true' do
        book.cover_state = 'bad'
        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'when the item is already archived' do
      it 'returns false' do
        book.archived = true
        expect(book.can_be_archived?).to be_falsey
      end
    end
  end
end
