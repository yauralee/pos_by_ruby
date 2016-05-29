require 'rspec'
require_relative '../parse_item_line'

RSpec.describe ParseItemLine do
  let(:item_line){'1 book at 12.49'}
  let(:parseItemLine){ParseItemLine.new(item_line)}
  describe '#parse' do
    context 'when give item_line'
    it 'should return item' do
      expect(parseItemLine.parse).class == Item
      expect(parseItemLine.parse.name).to eq('1 book at')
      expect(parseItemLine.parse.primary_price).to eq(12.49)
      expect(parseItemLine.parse.is_special).to eq(true)
      expect(parseItemLine.parse.is_import).to eq(false)
    end
  end

end