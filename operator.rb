$LOAD_PATH << '.'
require 'pos.rb'
require 'parse_item_line.rb'


class Operator
  include ParseItemLine
  def operate
    input_arr = ['1 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85']
    items = []
    input_arr.each do |input_line|
      item = Item.new(ParseInputLine.get_name(input_line),ParseInputLine.get_price(input_line),ParseInputLine.get_is_special(input_line),ParseInputLine.get_is_import(input_line))
      items.push(item)
    end
    Pos.new().calculate_bill(items)
  end

end