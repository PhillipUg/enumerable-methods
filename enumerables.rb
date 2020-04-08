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
    !block_given? && par.nil? ? true : false
    return true unless block_given? || !par.nil?

    my_each do |elem|
      return false if block_given? && prc.call(elem) == false        
      return false if (par.class == Integer) && (elem != par)
      return false if (par.class == Regexp) && (par.match(elem).nil?)        
      return false if (elem === false) || (elem === nil)      
    end
    true
  end

  def my_any?(par = nil, &prc)
    !block_given? && par.nil? ? true : false
    return true unless block_given? || !par.nil?

    my_each do |elem|
      return true if block_given? && prc.call(elem) == true        
      return true if (par.class == Integer) && (elem == par)
      return true if (par.class == Regexp) && (par.match(elem))      
      return true if (elem === false) || (elem === nil)      
    end
    false
  end
  
  def my_none?(par = nil, &prc)
    !my_any?(par, &prc)
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

  def my_map(prc = nil)
    return to_enum unless block_given?

    new_array = []
    my_each { |elem| new_array.push(prc.call(elem)) } if block_given? && prc      
    my_each { |elem| new_array.push(yield(elem)) } if prc.nil?
    new_array
  end

  def my_inject(memo = nil, sym = nil, &prc)
    memo = memo.to_sym if memo.is_a?(String) && !sym && !prc

    if memo.is_a?(Symbol) && !sym
      prc = memo.to_proc
      memo = nil
    end

    sym = sym.to_sym if sym.is_a?(String)
    prc = sym.to_proc if sym.is_a?(Symbol)

    my_each { |elem| memo = memo.nil? ? elem : prc.yield(memo, elem) }
    memo
  end
end

def multiply_els(arr)
  array = Array(arr)
  array.my_inject { |mult, elem| mult * elem }
end


