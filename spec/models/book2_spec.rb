require 'rails_helper'

RSpec.describe Book2, type: :model do
  describe '#bulk_import!' do
    context 'when valid' do
      let(:import_books) do
        [
          Book2.new(title: 'hoge', author_id: 1, pages: 100),
          Book2.new(title: 'fuga', author_id: 1, pages: 200)
        ]
      end

      it 'no exception' do
        expect{ Book2.bulk_import!(import_books) }.not_to raise_exception(ActiveRecord::RecordInvalid)
      end
    end

    context 'when invalid' do
      let(:import_books) do
        [
          Book2.new(title: 'hoge', author_id: 1, pages: -100),
          Book2.new(title: 'fuga', author_id: 1, pages: -200)
        ]
      end

      it 'exception' do
        expect{ Book2.bulk_import!(import_books) }.to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end

end
