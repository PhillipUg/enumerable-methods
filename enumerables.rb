module Enumerable
  def my_each
    return to_enum unless block_given?

    i = 0
    while i < size
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    index = 0
    while index < size
      yield self[index], index
      index += 1
    end
  end

  def my_select
    return to_enum unless block_given?

    selected = []
    my_each do |item|
      if yield(item)
        selected.push(item)
      end
    end
    selected
  end

  def my_all?(par = nil, &prc)
    !block_given? && arg.nil? && include?(nil) == false && include?(false) == false ? true : false
    return false unless block_given? || !arg.nil?

    my_each do |elem|
      return false if block_given? && prc.call(elem) == false        
      return false if (arg.class == Integer) && (elem != arg)
      return false if (arg.class == Regexp) && (arg.match(elem).nil?)        
      return false if (elem === false) || (elem === nil)      
    end
    true
  end

 def my_any?(arg = nil, &prc)
     !block_given? && arg.nil? && include?(nil) == false && include?(false) == false ? true : false
    return false unless block_given? || !arg.nil?

    my_each do |elem|
      return true if block_given? && prc.call(elem) == true        
      return true if (arg.class == Integer) && (elem == arg)
      return true if (arg.class == Regexp) && (arg.match(elem))      
      return true if (elem === false) || (elem === nil)      
    end
    false
  end

  def my_none?
    return to_enum unless block_given?

    my_each do |i|
      if yield i
        return false
      end
    end
    true
  end

  def my_count(par = nil)
    count = 0
    if par
      my_each do |item|
        count+=1 if item == par
      end
    elsif block_given?
      my_each do |item|
        count+=1 if yield item
      end
    else
      count = size
    end
    count
  end

  def my_map
    
  end

  def my_inject
  end

end

