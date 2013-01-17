class HomeController < ApplicationController


  def index
  end

  def post_linkedin_action
    require 'rubygems'
    require 'linkedin'

    # LinkedIn.configure do |config|
    #   config.token = "4pau5xpp6ls2"
    #   config.secret = "2PNyI4Q9vYBfsUOy"
    # end

    client = LinkedIn::Client.new("4pau5xpp6ls2", "2PNyI4Q9vYBfsUOy")
    client.authorize_from_access("010c91d7-2777-4f03-ac05-76d8012ae8ed", "08b71260-ebb8-45c5-9f35-3d525d8a2efa")

    now = DateTime.now.to_s
    client.add_share({:comment => now})
    redirect_to root_path    
  end

  def post_facebook_action
    # oauth = Koala::Facebook::OAuth.new("145330472289249", "14005f60212c790ef1163beed1a5c298", "http://smackaho.st:3000")
    now = DateTime.now.to_s
    graph = Koala::Facebook::API.new("AAACEdEose0cBABq943yA4TZCf2pHz0BjlYh3u2k8VXO0uxcbZAiavO3wZBdgM5fpK1lqo3SpxUUfOaIUw3CZAfKUiIrVC4lCyq2FdjOBm8KpjMgLcuoN")
    graph.put_object("me", "feed", :message => now)
    redirect_to root_path
  end

  def post_twitter_action
    require "rubygems"
    require "twitter"
 
    # Certain methods require authentication. To get your Twitter OAuth credentials,
    # register an app at http://dev.twitter.com/apps
    Twitter.configure do |config|
      config.consumer_key = 'iar1DDdoOpAEegkMKVrDsw'
      config.consumer_secret =  '1E6SX4HBllWkaqI20nT4RNuc0GaNxZktUQIzzBFY8fg'
      config.oauth_token = '927345289-P5GbSzCXPNC1wq6OZnkFHHMd2SkoqHiIfu7srO02'
      config.oauth_token_secret = 'QGjgBd88pKjhnzkDqgkf4NolqS0DIxREjVwgiN4aNQE'
    end
 
    # Initialize your Twitter client
    client = Twitter::Client.new
 
    # Post a status update
    now = DateTime.now.to_s
    client.update(now)
    # redirect_to request.referer, :notice => 'Tweet successfully posted'
    redirect_to root_path
  end

  def check_test_action
    session[:true_answer] = nil
    session[:true_answer] = 0

    session[:true_answer] += 1 unless params[:answer1] !="a"
    session[:true_answer] += 1 unless params[:answer2] !="c"
    session[:true_answer] += 1 unless params[:answer3] !="b"
    session[:true_answer] += 1 unless params[:answer4] !="a"
    session[:true_answer] += 1 unless params[:answer5] !="a"
    session[:true_answer] += 1 unless params[:answer6] !="c"
    session[:true_answer] += 1 unless params[:answer7] !="c"
    session[:true_answer] += 1 unless params[:answer8] !="a"
    session[:true_answer] += 1 unless params[:answer9] !="b"
    session[:true_answer] += 1 unless params[:answer10] !="c"    
    session[:true_answer] += 1 unless params[:answer11] !="b"
    session[:true_answer] += 1 unless params[:answer12] !="a"
    session[:true_answer] += 1 unless params[:answer13] !="c"
    session[:true_answer] += 1 unless params[:answer14] !="b"
    
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
