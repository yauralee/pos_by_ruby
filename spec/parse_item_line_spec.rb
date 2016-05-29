require 'rspec'
require_relative '../parse_item_line'

RSpec.describe ParseItemLine do
  let(:item_line){'1 book at 12.49'}
  let(:parseItemLine){ParseItemLine.new(item_line)}
  describe '#parse' do
    context 'when argument is item_line'
    it 'should return an item' do
      expect(parseItemLine.parse).class == Item
    end
    it 'should have item name' do
      expect(parseItemLine.parse.name).to eq('1 book at')
    end
    it 'should have item primary_price' do
      expect(parseItemLine.parse.primary_price).to eq(12.49)
    end
    it 'should have item is_special' do
      expect(parseItemLine.parse.is_special).to eq(true)
    end
    it 'should have item is_import' do
      expect(parseItemLine.parse.is_import).to eq(false)
    end
  end

end