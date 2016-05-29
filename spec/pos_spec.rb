require 'rspec'
require_relative '../pos'

RSpec.describe Pos do
  let(:items){[Item.new('1 book at',12.49,true,false),
               Item.new('1 music CD at',14.99,false,false),
               Item.new('1 chocolate bar at',0.85,true,false)]}

describe '#calculate_bill' do
  context 'when calculate items bill'
    it 'should return array' do
      pos = Pos.new
      expect(pos.calculate_bill(items)).to eq([[12.49, 16.489, 0.85], 1.499, 29.829])
    end
  end

end