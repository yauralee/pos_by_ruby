$LOAD_PATH << '.'
require 'item.rb'

class Output

  def generate_one_item(special_list,input_text)
    items = Array.new
    input_text.each do |j|
      item = Item.new
      item.name = j[/1.*at/]
      item.primary_price = j[/ at.*/].to_s.split(/at/)[1]
      item.ask_import(j)
      item.ask_special(j,special_list)
      items.push(item)
    end
    items
  end

  def output(special_list,input_text)
    sales_taxes = 0
    total = 0
    items = generate_one_item(special_list,input_text)
    items.each do |i|
      each_price = i.calEachPrice
      puts i.name.to_s + ':' + each_price.to_s
      each_tax = i.calEachTax
      sales_taxes += each_tax
      total += each_price
    end
    puts 'Sales Taxes: ' + sales_taxes.to_s
    puts 'Total: ' + total.to_s

  end
end

op = Output.new
special_list = ["book","chocolate","pills"]
input_text = ["1 book at 12.49","1 music CD at 14.99","1 chocolate bar at 0.85"]
op.output(special_list,input_text)