require_relative '../book'

RSpec.describe Book do
  let(:publisher) { 'Sample Publisher' }
  let(:cover_state) { 'good' }
  let(:book) { Book.new(publisher, cover_state, publish_date: '2022-01-01', archived: false) }

  describe '#can_be_archived?' do
    context 'when the cover state is good' do
      let(:cover_state) { 'good' }

      it 'returns false' do
        expect(book.can_be_archived?).to be_falsey
      end
    end

    context 'when the cover state is not bad or good' do
      let(:cover_state) { 'average' }

      it 'returns false' do
        expect(book.can_be_archived?).to be_falsey
      end
    end

    context 'when the item is already archived' do
      let(:book) { Book.new(publisher, cover_state, publish_date: '2022-01-01', archived: true) }

      it 'returns false' do
        expect(book.can_be_archived?).to be_falsey
      end
    end
  end
end
