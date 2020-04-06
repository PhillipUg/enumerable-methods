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


