class HomeController < ApplicationController

  def index

  end

  def upload_cv_action
    redirect_to root_path
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
  	redirect_to klant_worden_path
  end

  def send_subscribe_email_action    
    # session[:sending_email] = "U bent succesvol aangemeld voor de nieuwsbrief!"
    if UserMailer.notice(params[:email]).deliver
      flash[:sending_email] = 'successful'
    end    
    redirect_to root_path 
  end
  
end
