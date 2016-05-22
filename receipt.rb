$LOAD_PATH << '.'
require 'item.rb'


class Receipt

  def output(input_text) # Seems like a tool class
    sales_taxes = 0
    total = 0
    items = generate_one_item(input_text)
    items.each do |i|
      each_price = i.calEachPrice
      # puts i.name.to_s + ':' + each_price.to_s
      each_tax = i.calEachTax
      sales_taxes += each_tax
      total += each_price
    end
    st = 'Sales Taxes: ' + sales_taxes.to_s
    tl =  'Total: ' + total.to_s
    st+"\\n"+tl+"\\n"
  end

  def generate_one_item(input_text)
    items = Array.new
    input_text.each do |j|
      item = Item.new
      item.name = j[/1.*at/]
      item.primary_price = j[/ at.*/].to_s.split(/at/)[1]
      item.ask_import(j)
      item.ask_special(j)
      items.push(item)
    end
    puts items[2].name+items[2].primary_price
    items
  end

end
