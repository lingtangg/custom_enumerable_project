module Enumerable
  def my_each_with_index(&block)
    index = 0
    my_each do |el|
      block.call(el, index)
      index += 1
    end
  end

  def my_select(&block)
    selected = []
    my_each do |el|
      selected.push(el) if block.call(el)
    end
    selected
  end

  def my_all?(&block)
    counter = 0
    my_each do |el|
      if block.call(el) then counter += 1 end
    end
    counter == length
  end

  def my_any?(&block)
    my_each do |el|
      if block.call(el) then return true end
    end
    false
  end

  def my_none?(&block)
    my_each do |el|
      if block.call(el) then return false end
    end
    true
  end

  def my_count(&block)
    if block_given?
      count = 0
      my_select do |el|
        if block.call(el) then count += 1 end
      end
      count
    else
      length
    end
  end

  def my_map(&block)
    mapped = []
    my_each { |el| mapped.push(block.call(el)) }
    mapped
  end

  def my_inject(memo = 0, &block)
    injected = memo
    my_each do |el|
      injected = block.call(injected, el)
    end
    injected
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    i = 0
    while i < length
      block.call(self[i])
      i += 1
    end
    self
  end
end
