class HomeController < ApplicationController
  def index
  end

  def check_test_action
    session[:true_answer] = nil
    session[:true_answer] = 0

    session[:true_answer] += 1 unless params[:answer1] !="a"
    session[:true_answer] += 1 unless params[:answer2] !="a"
    session[:true_answer] += 1 unless params[:answer3] !="a"
    session[:true_answer] += 1 unless params[:answer4] !="a"
    session[:true_answer] += 1 unless params[:answer5] !="a"
    session[:true_answer] += 1 unless params[:answer6] !="a"
    session[:true_answer] += 1 unless params[:answer7] !="a"
    session[:true_answer] += 1 unless params[:answer8] !="a"
    session[:true_answer] += 1 unless params[:answer9] !="a"
    session[:true_answer] += 1 unless params[:answer10] !="a"    
    session[:true_answer] += 1 unless params[:answer11] !="a"
    session[:true_answer] += 1 unless params[:answer12] !="a"
    session[:true_answer] += 1 unless params[:answer13] !="a"
    session[:true_answer] += 1 unless params[:answer14] !="a"
    
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

  def send_subscribe_email_action
    UserMailer.notice(params[:email]).deliver
    redirect_to root_path
  end
  
end
