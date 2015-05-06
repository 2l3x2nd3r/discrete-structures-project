class AttachmentsController < ApplicationController
  def attachment1
    @selectables = []
  end

  def attachment2
    if params[:n]
      k = params[:k] != '' ? params[:k].to_i : 3
      @selectables = Attachment.attachment2_solution(params[:n].to_i, k).each_slice(10).to_a.paginate(page: params[:page], per_page: 10)
    else
      @selectables = []
    end
  end

  def attachment3
    if params[:array]
      array = params[:array].split(',').map! { |item| item.to_i }
      k = params[:k] != '' ? params[:k].to_i : 20
      @selectables = attachment3_solution(array, k)[0].paginate(page: params[:page], per_page: 3)
    else
      @selectables = []
    end
  end

  def attachment4
  end
end
