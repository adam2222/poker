require 'byebug'

class Array
  def my_uniq
    uniques = []
    self.each do |item|
      uniques << item unless uniques.include?(item)
    end

    uniques
  end

  def two_sum
    two_summed = []
    self.each_with_index do |item, index|
      self.each_with_index do |item2, index2|
        next if index > index2 || index == index2
        if self[index] + self[index2] == 0
          two_summed << [index, index2]
        end
      end
    end

    two_summed
  end

  def my_transpose
    matrix_size = self.length

    transposed = Array.new(matrix_size) { Array.new(matrix_size) }

    self.each_with_index do |item, index1|
      item.each_with_index do |_, index2|
        transposed[index1][index2] = self[index2][index1]
      end
    end

    transposed
  end

  def stock_picker
    return nil if self.length < 2

    picked = []
    current_largest = 0

    self[0..-2].each_with_index do |item1, index1|
      self.each_with_index do |item2, index2|
        # byebug
        next if index1 >= index2
        if item2 - item1 > current_largest
          current_largest = item2 - item1
          picked = [index1, index2]
        end
      end
    end

    picked
  end
end
