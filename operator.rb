$LOAD_PATH << '.'
require 'pos.rb'
require 'parse_item_line.rb'


class Operator
  def operate(pos,input_orders)
    items = []
    input_orders.each do |input_line|
      parseItem = ParseItemLine.new(input_line)
      item = parseItem.parse
      items.push(item)
    end
    pos.calculate_bill(items)
  end

end