class Item
  attr_accessor :name, :primary_price, :is_special, :is_import
  def initialize(name, primary_price, is_special, is_import)
    @name = name
    @primary_price = primary_price
    @is_special = is_special
    @is_import = is_import
  end
end
