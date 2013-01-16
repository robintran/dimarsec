class HomeController < ApplicationController
  def index
  end

  def check_test_action
    session[:false_answer] = nil
    session[:false_answer] = 0

    if params[:answer1] != "a"
      session[:false_answer] += 1
    end
    if params[:answer2] != "a"
      session[:false_answer] += 1
    end
    if params[:answer3] != "a"
      session[:false_answer] += 1
    end
    if params[:answer4] != "a"
      session[:false_answer] += 1
    end
    if params[:answer5] != "a"
      session[:false_answer] += 1
    end
    if params[:answer6] != "a"
      session[:false_answer] += 1
    end
    if params[:answer7] != "a"
      session[:false_answer] += 1
    end
    if params[:answer8] != "a"
      session[:false_answer] += 1
    end
    if params[:answer9] != "a"
      session[:false_answer] += 1
    end
    if params[:answer10] != "a"
      session[:false_answer] += 1
    end
    if params[:answer11] != "a"
      session[:false_answer] += 1
    end

    redirect_to solliciteren_results_path
  end

  def klant_worden_action
  	UserMailer.signup_confirmation(params[:answer1_question1],
  		params[:answer1_question2],
  		params[:answer1_question3], params[:answer2_question3], params[:answer3_question3],
  		params[:answer1_question4],
  		params[:answer1_question5], params[:answer2_question5], params[:answer3_question5],
  		params[:answer1_question6], params[:answer2_question6], params[:answer3_question6],
  		params[:answer1_question7],
  		params[:answer1_question8], params[:answer2_question8],
  		params[:answer1_question9], params[:answer2_question9],
  		params[:answer1_question11],
  		params[:answer1_question11], params[:answer2_question11], params[:answer3_question11], params[:answer4_question11], params[:answer5_question11]).deliver
  	redirect_to home_klant_worden_path
  end 
end
