class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def attachment2_solution(array, k)
    partitions = []
    array.each_cons(k) { |item| partitions << item }
    selectables = []

    partitions.each do |partition|
      i = partition.first
      n = partition.last + 1
      num1 = partition.reduce(:+)
      dist = n - i
      num2 = (n * (n + 1)) / (2) - (i * (i + 1)) / (2) - dist
      if num1 != num2
        selectables << partition
      end
    end
    selectables
  end
end
