module Enumerable
  def my_each
    return to_enum unless block_given?
    
    for item in self
      yield item
    end
    self
  end

  def my_each_with_index
 
  end

  def my_select
    
  end

  def my_all?
    
  end

  def my_any?
    
  end

  def my_none?
    
  end

  def my_count
    
  end

  def my_map
    
  end

  def my_inject
    
  end

  def multiply_els
    
  end
end

[5,3,2,7,"man", "dog", [6,0,9]].my_each_with_index { |ele, idx| p "#{ele} #{idx}" }