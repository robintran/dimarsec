class HomeController < ApplicationController

  def index
    if session[:request_token]
      access_token = get_access_token(session[:request_token])
      session[:access_token] = access_token
      session[:request_token] = nil

      post_to_twitter(session[:access_token])

      # redirect_to root_path
    end
    if session[:facebook]
      # client.authorization_code = params[:code]
      fb_auth = FbGraph::Auth.new(fb_id, fb_secret)
      client = fb_auth.client
      client.authorization_code = params[:code]
      fb_access_token = client.access_token! :client_auth_body

      me = FbGraph::User.me(ACCESS_TOKEN)
      me.feed!(
        :message => 'Updating via FbGraph',
        :picture => 'https://graph.facebook.com/matake/picture',
        :link => 'https://github.com/nov/fb_graph',
        :name => 'FbGraph',
        :description => 'A Ruby wrapper for Facebook Graph API'
      )

      # redirect_to root_path
    end
  end

  def post_facebook_action
    session[:facebook] = true 
    fb_auth = FbGraph::Auth.new(fb_id, fb_secret)
    client = fb_auth.client
    client.redirect_uri = "http://dimarsec-dev.herokuapp.com"
    redirect_to client.authorization_uri(:scope => [:email, :read_stream, :offline_access])
    # oauth = Koala::Facebook::OAuth.new(fb_id, fb_secret)
    # fb_access_token = oauth.parse_signed_request(params[:signed_request])["oauth_token"] 
    # @graph = Koala::Facebook::API.new(fb_access_token)
    # now = DateTime.now
    # @graph.put_connections("me", "feed", :message => now)

    # redirect_to root_path
    
  end

  #*****************************************
  # Begin supporting for post twitter action
  def fb_id
    return "325004784270336"    
  end
  def fb_secret
    return "fa4fe593d97335f2d0bc27e796761d79"
  end
  # End supporting for post switter action
  #*****************************************


  # post to twitter
  def post_twitter_action
    if session[:access_token]
      post_to_twitter(session[:access_token])

      redirect_to root_path
    else
      @request_token = get_consumer.get_request_token(:oauth_callback => "http://smackaho.st:3000/")
      session[:request_token] = @request_token
      redirect_to @request_token.authorize_url
    end
  end

  #*****************************************
  # Begin supporting for post twitter action
  def post_to_twitter(access_token)
    twitter_config(session[:access_token])

    client = Twitter::Client.new
    now = DateTime.now
    client.update(now)
  end
  def get_access_token(request_token)
    url = request.fullpath
    oauth_verifier = url.split('oauth_verifier=')[1]
    signing_consumer = get_consumer
    token = request_token.token
    secret = request_token.secret
    access_token = OAuth::RequestToken.new(signing_consumer, token, secret). get_access_token(:oauth_verifier => oauth_verifier)
  end
  def twitter_config(access_token)
    oauth_token = access_token.params[:oauth_token]
    oauth_token_secret = access_token.params[:oauth_token_secret]
    Twitter.configure do |config|
      config.consumer_key = app_key
      config.consumer_secret = app_secret
      config.oauth_token = oauth_token
      config.oauth_token_secret = oauth_token_secret
    end
  end
  def get_consumer
    return OAuth::Consumer.new(app_key, app_secret,{ :site=>"http://twitter.com" })
  end
  def app_key
    return "4iUq2TNrl3scEYsYH800mw"
  end
  def app_secret
    return "3y4rwvIxdi6K9x6wHh8MEo8jH2Sy0UEZlwLY9qJgk"
  end
  # End supporting for post switter action
  #*****************************************

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
