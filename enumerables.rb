module Enumerable
  def my_each
    return to_enum unless block_given?

    for item in self
      yield item
    end
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    index = 0
    for item in self
      yield item, index
      index += 1
    end
    self
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

  def my_all?
    return to_enum unless block_given?

    selected = my_select {|item| yield item}
    if self == selected
      return true
    end
    false
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
        count+=1 if item == arg
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

  def multiply_els
  end
end

p [5, 3, 2, 7, 6, 0, 9].my_count { |ele| ele.even? }
