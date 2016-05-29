$LOAD_PATH << '.'
require 'item.rb'
require 'yaml'

class ParseItemLine

  def initialize(item_line)
    @item_line = item_line
  end

  def get_name
    regex_match_name = /1.*at/
    @item_line[regex_match_name]
  end

  def get_primary_price
    regex_match_after_at = / at.*/
    regex_match_at = /at/
    @item_line[regex_match_after_at].to_s.split(regex_match_at)[1].to_f
  end

  def get_is_special
    special_list = YAML.load(File.open('special_list.yml'))
    special_list.map { |each_one| @item_line.include?(each_one) ? true : false}.include?(true)
  end

  def get_is_import
    @item_line.include?('import') ? true : false
  end

  def parse
    Item.new(get_name,get_primary_price,get_is_special,get_is_import)
  end

  private :get_name, :get_primary_price, :get_is_special, :get_is_import

end
