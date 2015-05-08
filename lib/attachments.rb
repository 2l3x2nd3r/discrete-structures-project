module Attachment

  def self.attachment1_solution(n, k = n)
    return [[]] if n == 0
    enum_controller = [k, n].min.downto(1)
    enum_controller.collect_concat do |i|
      vec = self.attachment1_solution(n - i, i)
      vec.collect { |rest| [i, *rest] }
    end
  end

  def self.attachment2_solution(n, k)
    selectables = []
    partitions = Array.new(n) { |i| i + 1 }.permutation(k) do |partition|
      c1 = self.consecutive?(partition, 1)
      c2 = self.consecutive?(partition, -1)
      unless c1 or c2
        selectables << partition
      end
    end
    selectables
  end

  def self.attachment3_solution(array, k)
    pre_selectables = []
    selectables = []
    self.attachment1_solution(k).each { |item| pre_selectables << item.reverse if item.reduce(:+) == k and item.size == array.size }
    pre_selectables.each do |pre_selectable|
      selectables << pre_selectable if self.greater_than_condition?(array, pre_selectable)
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

  def self.greater_than_condition?(array, pre_selectable)
    pre_selectable.each_with_index do |item, i|
      if item < array[i]
        return false
      end    
    end
    true
  end

end
