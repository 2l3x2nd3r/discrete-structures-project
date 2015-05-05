class AttachmentsController < ApplicationController
  def attachment1
    @selectables = []
  end

  def attachment2
    if params[:array]
      array = params[:array].split(',').map! { |item| item.to_i }
      k = params[:k] != '' ? params[:k].to_i : 2
      @selectables = Attachment.attachment2_solution(array, k)[0].paginate(page: params[:page1], per_page: 3)
      @no_selectables = Attachment.attachment2_solution(array, k)[1].paginate(page: params[:page2], per_page: 3)
    else
      @selectables = []
      @no_selectables = []
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
