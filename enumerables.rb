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
    if !block_given?
      return true
    elsif par == Integer && self.class == Integer
      return true
    end

    my_each do |item|
      if prc.call(item) == false
        return false
      end
    end
    true
  end

  def my_any?
    return to_enum unless block_given?

    my_each do |i|
      if yield i
        return true
      end
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

