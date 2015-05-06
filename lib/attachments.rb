module Attachment

  def self.attachment2_solution(n, k)

    partitions = Array.new(n) { |i| i + 1 }.permutation(k).to_a
    selectables = []
    no_selectables = []

    partitions.each do |partition|
      c1 = self.consecutive?(partition, 1)
      c2 = self.consecutive?(partition, -1)
      if c1 or c2
        no_selectables << partition
      else
        selectables << partition
      end
    end
    selectables
  end

  def self.attachment3_solution(array, k)
    n = array.size - 1
    max = array.max
    array.map! { max }

    unless greater_than_condition?(array)

    end

    selectables = []
    while array.first < k
      while array[n] < k
        if greater_than_condition?(array)
          sum = array.reduce :+
          selectables << array if sum == k
        end
      end
    end
    selectables
  end

  private

  def self.consecutive?(array, signo)
    array.each_with_index do |item, i|
      if((item + 1*signo) != array[i + 1] && i < array.size - 1)
        return false
      end
    end
    true
  end

  def self.greater_than_condition?(array)
    array.each_with_index do |item, i|
      if i < array.size - 1
        return false if item > array[i + 1]
      end     
    end
    true
  end

end