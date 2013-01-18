class HomeController < ApplicationController

  def index
    if session[:request_token]
      url = request.fullpath
      oauth_verifier = url.split('oauth_verifier=')[1]
      signing_consumer = OAuth::Consumer.new("4iUq2TNrl3scEYsYH800mw", "3y4rwvIxdi6K9x6wHh8MEo8jH2Sy0UEZlwLY9qJgk",{ :site=>"http://twitter.com" })
      access_token = OAuth::RequestToken.new(signing_consumer, session[:request_token], session[:request_token_secret]). get_access_token(:oauth_verifier => oauth_verifier)
      oauth_token = access_token.params[:oauth_token]
      oauth_token_secret = access_token.params[:oauth_token_secret]
      Twitter.configure do |config|
        config.consumer_key = "4iUq2TNrl3scEYsYH800mw"
        config.consumer_secret = "3y4rwvIxdi6K9x6wHh8MEo8jH2Sy0UEZlwLY9qJgk"
        config.oauth_token = oauth_token
        config.oauth_token_secret = oauth_token_secret
      end

      client = Twitter::Client.new
      now = DateTime.now
      client.update(now)
    end
  end

  def self.consumer
    OAuth::Consumer.new("4iUq2TNrl3scEYsYH800mw", "3y4rwvIxdi6K9x6wHh8MEo8jH2Sy0UEZlwLY9qJgk",{ :site=>"http://twitter.com" })
  end

  def post_twitter_action
    @request_token = HomeController.consumer.get_request_token(:oauth_callback => "http://smackaho.st:3000")
    session[:request_token] = @request_token.token
    session[:request_token_secret] = @request_token.secret

    puts "****************"
    puts @request_token.authorize_url
    puts "****************"

    redirect_to @request_token.authorize_url

    return
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
    UserMailer.notice(params[:email]).deliver
    redirect_to root_path
  end
  
end
