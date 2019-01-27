require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#bulk_import!' do
    context 'when valid' do
      let(:import_books) do
        [
          Book.new(title: 'hoge', author_id: 1, pages: 100),
          Book.new(title: 'fuga', author_id: 1, pages: 200)
        ]
      end

      it 'no exception' do
        expect{ Book.bulk_import!(import_books) }.not_to raise_exception(ActiveRecord::RecordInvalid)
      end
    end

    context 'when invalid' do
      let(:import_books) do
        [
          Book.new(title: 'hoge', author_id: 1, pages: -100),
          Book.new(title: 'fuga', author_id: 1, pages: -200)
        ]
      end

      it 'exception' do
        expect{ Book.bulk_import!(import_books) }.to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end

end
