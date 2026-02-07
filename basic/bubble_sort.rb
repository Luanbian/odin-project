# frozen_string_literal: true

array = [4,3,78,2,0,2]

def bubble_sort(array)
  n = array.length

  loop do
    swapped = false

    (0...(n - 1)).each { |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    }

    break unless swapped
  end

  array
end

p bubble_sort(array)
