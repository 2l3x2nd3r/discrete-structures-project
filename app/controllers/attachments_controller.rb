class AttachmentsController < ApplicationController
 
  def attachment1
    if params[:n]
      @selectables = Attachment.attachment1_solution(params[:n].to_i).each_slice(5).to_a.paginate(page: params[:page], per_page: 5)
    else
      @selectables = []
    end
  end

  def attachment2
    if params[:n]
      n = params[:n].to_i
      k = params[:k] != '' ? params[:k].to_i : 3
      if n < 15 and k < 7
        @selectables = Attachment.attachment2_solution(n, k).each_slice(10).to_a.paginate(page: params[:page], per_page: 10)
      else
        @selectables = []
        @message = "N should be less than 15 and K less than 7"
      end
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
