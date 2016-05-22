require 'spec_helper'
require_relative '../receipt'
require 'item'

RSpec.describe Receipt do
  let(:receipt){Receipt.new}
  let(:input_text){["1 book at 12.49","1 music CD at 14.99","1 chocolate bar at 0.85"]}
  context 'when run the method generate_one_item' do
    let(:result){receipt.generate_one_item(input_text)}
    it 'return an array of item' do
      expect(result[0].name+result[0].primary_price).to eq('1 book at 12.49')
      expect(result[1].name+result[1].primary_price).to eq('1 music CD at 14.99')
      expect(result[2].name+result[2].primary_price).to eq('1 chocolate bar at 0.85')
    end
  end

  context 'when run the method output' do
    let(:result){receipt.output(input_text)}
    it 'should return true' do
      expect(result).to eq('Sales Taxes: 1.5\nTotal: 29.83\n')
    end
  end
end

describe Item do
  let(:item){Item.new}
  let(:each_input){'1 book at 12.49'}
  context 'when run the method ask_special' do
    let(:result){item.ask_special(each_input)}
    it 'should return true'do
      expect(result).to be_truthy
    end
  end
  context '#ask_import' do
    let(:result){item.ask_import(each_input)}
    it 'should return false'do
      expect(result).to be_falsey
    end
  end
  context '#calEachTax' do
    let(:result){item.calEachTax}
    it 'should return 0.0'do
      expect(result).to equal(0.0)
    end
  end
end




