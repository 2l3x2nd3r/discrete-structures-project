class AttachmentsController < ApplicationController
  def attachment1
  end

  def attachment2
    if params[:array]
      array = params[:array].split(',').map! { |item| item.to_i }
      k = params[:k] != '' ? params[:k].to_i : 2
      @selectables = attachment2_solution(array, k).paginate(page: params[:page], per_page: 5)
    else
      @selectables = []
    end
  end

  def attachment3
  end

  def attachment4
  end
end
