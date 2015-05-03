class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def attachment2_solution(array, k)
    partitions = []
    array.each_cons(k) { |item| partitions << item }
    selectables = []
    no_selectables = []

    partitions.each do |partition|
      c1 = consecutivo?(partition, 1)
      c2 = consecutivo?(partition, -1)
      if c1 or c2
        no_selectables << partition
      else
        selectables << partition
      end
    end
    [selectables, no_selectables]
  end

  def consecutivo?(array, signo)
    array.each_with_index do |item, i|
      if((item + 1*signo) != array[i + 1] && i < array.size - 1)
        return false
      end
    end
    true
  end
end
