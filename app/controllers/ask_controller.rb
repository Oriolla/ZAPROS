class AskController < ApplicationController

  def index
    @current_locale = I18n.locale
    @criteria_count = TwoCriterium.where(:uses => false).count
    if session[:counter].nil? or session[:counter]==0  # Первый проход, инициализация по 2критериям
      @request_data = new_request_constructor()
    else
      if session[:counter] <3
        @request_data = {}
        puts ("Session counter: #{session[:counter]}")
        @request_data[:assessments1] = Criterium.find(session[:criteria1_id]).assessments.order(id: :asc)
        @request_data[:assessments2] = Criterium.find(session[:criteria2_id]).assessments.order(id: :asc)
        session[:counter] +=1
        if params[:decision] == "assessment1"
          new_ass_arr = change_assessments(session[:assessment11_id], session[:assessment12_id], @request_data[:assessments1])
          session[:assessment11_id] = new_ass_arr[0]
          session[:assessment12_id] = new_ass_arr[1]
        else
          new_ass_arr = change_assessments(session[:assessment21_id], session[:assessment22_id], @request_data[:assessments2])
          session[:assessment21_id] = new_ass_arr[0]
          session[:assessment22_id] = new_ass_arr[1]
        end
      else  # Последние проходы
        if @criteria_count < 1 and session[:counter]>2 # Самый последний проход, конец
          redirect_to :controller => 'requests' and return true
        end
        @request_data = new_request_constructor()
      end
    end
      @assessment11 = @request_data[:assessments1][session[:assessment11_id]-1]
      @assessment12 = @request_data[:assessments2][session[:assessment12_id]-1]
      @assessment21 = @request_data[:assessments1][session[:assessment21_id]-1]
      @assessment22 = @request_data[:assessments2][session[:assessment22_id]-1]
  end


  def new_request_constructor()
    @request_data = {}
    @request_data[:two_criterias] = TwoCriterium.where(:uses => false).order(id: :asc)[0]
    if @request_data[:two_criterias]
      session[:two_criterias_id] = @request_data[:two_criterias].id
      session[:criteria1_id] = @request_data[:two_criterias]["criteria1_id"]
      session[:criteria2_id] = @request_data[:two_criterias]["criteria2_id"]
      @request_data[:assessments1] = Criterium.find(session[:criteria1_id]).assessments.order(id: :asc)
      @request_data[:assessments2] = Criterium.find(session[:criteria2_id]).assessments.order(id: :asc)
      session[:assessments1] = @request_data[:assessments1]
      session[:assessments2] = @request_data[:assessments2]
      session[:assessment11_id] = 1
      session[:assessment12_id] = 2
      session[:assessment21_id] = 2
      session[:assessment22_id] = 1
      session[:counter] = 1
      TwoCriterium.where(:uses => false).order(id: :asc)[0].update(uses:true)
    end
    @request_data
  end


  def update_request
    @assessment11_id = session[:assessments1][session[:assessment11_id]-1]["id"]
    @assessment12_id = session[:assessments2][session[:assessment12_id]-1]["id"]
    @assessment21_id = session[:assessments1][session[:assessment21_id]-1]["id"]
    @assessment22_id = session[:assessments2][session[:assessment22_id]-1]["id"]
    @len_assessment = Criterium.all.first.assessments.count
    @ans_id = session[:counter]+(session[:two_criterias_id]-1)*@len_assessment
    @req_ask = Request.where(id:@ans_id)[0]

    if @req_ask
      @req_ask.update( assessment11_id: @assessment11_id,
                       assessment12_id: @assessment12_id,
                       assessment21_id: @assessment21_id,
                       assessment22_id: @assessment22_id,
                       ans:params[:decision])
    else
      @req_ask = Request.new(id:@ans_id,assessment11_id: @assessment11_id,
                      assessment12_id: @assessment12_id,
                      assessment21_id: @assessment21_id,
                      assessment22_id: @assessment22_id,
                      ans: params[:decision])
      @req_ask.save
    end
    redirect_to ask_url decision: params[:decision]
  end


private
  def request_params
    params.require(:request).permit( :decision)
  end

  def change_assessments(assessmen1_id, assessmen2_id, assessments)
    len = assessments.count
    if assessmen2_id == 1
      if assessmen1_id < len
        assessmen1_id+=1
      else
        x=assessmen1_id
        assessmen1_id = assessmen2_id
        assessmen2_id = x
      end
    else
      if assessmen2_id < len
        assessmen2_id+=1
      else
        x=assessmen1_id
        assessmen1_id = assessmen2_id
        assessmen2_id = x
      end
    end
    [assessmen1_id, assessmen2_id]
  end
end
