require 'spec_helper'
require_relative '../output'
require 'item'

RSpec.describe 'generate_one_item' do
  it 'should return true' do
    out = Output.new
    special_list = ["book","chocolate","pills"]
    input_text = ["1 book at 12.49","1 music CD at 14.99","1 chocolate bar at 0.85"]
    result = out.generate_one_item(special_list,input_text)
    expect(result[0].name+result[0].primary_price).to eq('1 book at 12.49')
    expect(result[1].name+result[1].primary_price).to eq('1 music CD at 14.99')
    expect(result[2].name+result[2].primary_price).to eq('1 chocolate bar at 0.85')
  end
end

RSpec.describe 'output' do
  it 'should return true' do
    out = Output.new
    special_list = ["book","chocolate","pills"]
    input_text = ["1 book at 12.49","1 music CD at 14.99","1 chocolate bar at 0.85"]
    result = out.output(special_list,input_text)
    expect(result).to eq('Sales Taxes: 1.5\nTotal: 29.83\n')
  end
end

RSpec.describe 'ask_special' do
  it 'should return true' do
    item = Item.new
    special_list = ["book","chocolate","pills"]
    each_input = '1 book at 12.49'
    result = item.ask_special(each_input,special_list)
    result.should == true
  end
end

RSpec.describe 'ask_import' do
  it 'should return true' do
    item = Item.new
    each_input = '1 book at 12.49'
    result = item.ask_import(each_input)
    result.should == false
  end
end

RSpec.describe 'calEachTax' do
  it 'should return true' do
    i = Item.new
    i.name = '1 book at'
    i.primary_price = 12.49
    i.is_special = true
    i.is_import = false
    i.calEachTax.should == 0
  end
end
