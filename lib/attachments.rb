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

  def self.attachment4_solution(exercise)
    selectables = []

    if exercise == '20a'
      (0..440000).each do |num|
        ns = num.to_s.split('')
        if ns.size == 5
          if ns[0].to_i < 5
            sum = ns.map { |item| item.to_i }.reduce :+
            if sum == 8
              selectables << ns
            end
          end
        elsif ns.size == 6
          if ns[1].to_i < 5
            sum = ns.map { |item| item.to_i }.reduce :+
            if sum == 8
              selectables << ns
            end
          end
        else
          sum = ns.map { |item| item.to_i }.reduce :+
          if sum == 8
            selectables << ns
          end
        end
      end
    elsif exercise == '38'
      num = []
      den = []
      ['W','I','S','C','O','N','S','I','N'].permutation do |p|
        wi = p.index('W')
        pi = p.index('I')
        pri = p.rindex('I')
        po = p.index('O')
        c = [pi, pri, po].sort.combination(2).to_a

        w11 = self.consecutive?([wi, pi], 1)
        w12 = self.consecutive?([wi, pi], -1)
        w21 = self.consecutive?([wi, pri], 1)
        w22 = self.consecutive?([wi, pri], -1)

        c1 = self.consecutive?(c[0], 1)
        c2 = self.consecutive?(c[2], 1)

        if c1 == false and c2 == false
          den << p
          if w11 or w12 or w21 or w22
            num << p
          end
        end
      end
      selectables = num.uniq
      selectables << "[#{selectables.size}/#{den.uniq.size}]"
    elsif exercise == '45'
      selectables = self.attachment2_solution(14, 6)
    elsif exercise == '47'
      num = ['1','1','1','0','0','0','0','0']

      num.permutation(num.size) do |p|
        selectables << p if p.join.split('1').select { |i| i != '' }.size == 3
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

  def self.greater_than_condition?(array, pre_selectable)
    pre_selectable.each_with_index do |item, i|
      if item < array[i]
        return false
      end    
    end
    true
  end

end
