class AttachmentsController < ApplicationController
 
  def attachment1
    if params[:n]
      n = params[:n].to_i
      if n < 51
        if params[:page]
          @selectables = $last_selectables1
          @selectables = @selectables.paginate(page: params[:page], per_page: 5)
        else
          @selectables = Attachment.attachment1_solution(n).each_slice(5).to_a
          $last_selectables1 = @selectables
          @selectables = @selectables.paginate(page: params[:page], per_page: 5)
        end
        
      else
        @selectables = []
        @message = "N should be less than 51"
      end
    else
      @selectables = []
    end
  end

  def attachment2
    if params[:n]
      n = params[:n].to_i
      k = params[:k] != '' ? params[:k].to_i : 3
      if n < 15 and k < 7
        if params[:page]
          @selectables = $last_selectables2
          @selectables = @selectables.paginate(page: params[:page], per_page: 10)
        else
          @selectables = Attachment.attachment2_solution(n, k).each_slice(10).to_a
          $last_selectables2 = @selectables
          @selectables = @selectables.paginate(page: params[:page], per_page: 10)
        end
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
      if k < 51
        if params[:page]
          @selectables = $last_selectables3
          @selectables = @selectables.paginate(page: params[:page], per_page: 5)
        else
          @selectables = Attachment.attachment3_solution(array, k).each_slice(5).to_a
          $last_selectables3 = @selectables
          @selectables = @selectables.paginate(page: params[:page], per_page: 5)
        end
      else
        @selectables = []
      end
    else
      @on_index = true
      @selectables = []
    end
  end

  def attachment4
    if params[:exercise]
      if params[:page]
        @selectables = $last_selectables4
        @selectables = @selectables.paginate(page: params[:page], per_page: 5)
      else
        @selectables = Attachment.attachment4_solution(params[:exercise]).each_slice(5).to_a
        $last_selectables4 = @selectables
        @selectables = @selectables.paginate(page: params[:page], per_page: 5)
      end
    else
      @selectables = []
    end
  end
end
