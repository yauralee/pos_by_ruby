require 'rspec'
require_relative '../pos'
require_relative '../operator'


RSpec.describe Operator do
  let(:input_line){['1 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85']}
  let(:pos){Pos.new}
  let(:operator){Operator.new}

  describe '#operate' do
    context 'when get input_line and pos'
    it 'should return array' do
      expect(operator.operate(pos,input_line)).to eq([[12.49, 16.489, 0.85], 1.499, 29.829])
    end
  end

end