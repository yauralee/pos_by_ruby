module ParseItemLine

  def get_name(item_line)
    regex = /1.*at/
    item_line[regex]
  end

  def get_primary_price(item_line)
    regex1 = / at.*/
    regex2 = /at/
    item_line[regex1].to_s.split(regex2)[1].to_f
  end

  def get_is_special(item_line)
    special_list = YAML.load(File.open('special_list.yml'))
    special_list.map { |each_one| item_line.include?(each_one) ? true : false}.include?(true)
  end

  def get_is_import(item_line)
    item_line.include?('import') ? true : false
  end

  module_function  :get_name, :get_primary_price, :get_is_special, :get_is_import

end
