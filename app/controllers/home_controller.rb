class HomeController < ApplicationController

  def index

  end

  def solliciteren_action   
    session[:false_answer] = "questions"
    if request.post?
      true_answer = 0
      true_answer += 1 unless params[:answer1] !="a"
      true_answer += 1 unless params[:answer2] !="c"
      true_answer += 1 unless params[:answer3] !="b"
      true_answer += 1 unless params[:answer4] !="a"
      true_answer += 1 unless params[:answer5] !="a"
      true_answer += 1 unless params[:answer6] !="c"
      true_answer += 1 unless params[:answer7] !="c"
      true_answer += 1 unless params[:answer8] !="a"
      true_answer += 1 unless params[:answer9] !="b"
      true_answer += 1 unless params[:answer10] !="c"    
      true_answer += 1 unless params[:answer11] !="b"
      true_answer += 1 unless params[:answer12] !="a"
      true_answer += 1 unless params[:answer13] !="c"
      true_answer += 1 unless params[:answer14] !="b"

      session[:false_answer] = (14 - true_answer).to_s
    end
    redirect_to solliciteren_path

  end

  def sollicitatie_formulier_action
    session[:false_answer] = "formulier"
    redirect_to solliciteren_path
  end
  
end
