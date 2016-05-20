class Item

  attr_accessor :name,:primary_price,:is_special,:is_import

  def ask_special(each_input,special_list)
    special_list.each do |k|
      self.is_special = each_input.include?(k) ? true : false
      if is_special
        break
      end
    end
    is_special
  end

  def ask_import(each_input)
    a = 'import'
    self.is_import = each_input.include?(a) ? true : false
  end


  def calEachTax
    unless self.is_special
      special_tax = primary_price.to_f * 0.1
    else
      special_tax = 0
    end
    if self.is_import
      import_tax = self.primary_price.to_s.to_f * 0.05
    else
      import_tax = 0
    end
    # puts special_tax
    # puts import_tax
    ((special_tax + import_tax)*100).round.to_f/100
  end


  def calEachPrice
    ((self.calEachTax + primary_price.to_s.to_f)*100).round.to_f/100
  end

end