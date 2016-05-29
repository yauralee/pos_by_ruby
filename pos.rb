$LOAD_PATH << '.'
require 'item.rb'

class Pos
  attr_accessor :each_item_price, :total_tax, :total_price
  def calculate_bill(items)
    @total_tax = 0
    @total_price = 0
    @each_item_price_array = []
    items.each do |item|
      special_tax = item.is_special ? 0 : item.primary_price * 0.1
      import_tax = item.is_import ? item.primary_price * 0.05 : 0
      @each_item_tax = special_tax + import_tax
      @each_item_price = item.primary_price + @each_item_tax
      @each_item_price_array.push(@each_item_price)
      @total_tax += @each_item_tax
      @total_price += @each_item_price
    end
    [@each_item_price_array, @total_tax, @total_price]
  end

end


