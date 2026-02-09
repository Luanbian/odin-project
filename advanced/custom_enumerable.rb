module Enumerable
  def my_find
    return to_enum(:my_find) unless block_given?

    each do |elem|
      return elem if yield(elem)
    end

    nil
  end

  def my_each
    return to_enum(:my_each) unless block_given?

    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []

    for item in self
      result.push(item) if yield(item)
    end

    result
  end
end

a = [1, 2, 3]
res = a.my_find { |num| num > 2 }
puts res

a.my_each { |num| puts num * 2 }
a.my_each_with_index { |num, index| puts "#{num} --- #{index}" }
res = a.my_select { |num| num > 1 }
puts res
