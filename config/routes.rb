Dimarsec::Application.routes.draw do
  #page home index
  get "home/index"

  #page klant_worden
  get "home/klant_worden"
  post "home/klant_worden"
  match "/klant_worden" => "home#klant_worden"
  match "/klant_worden_action" => "home#klant_worden_action"

  #page over_ons
  get "home/over_ons"
  match "/over_ons" => "home#over_ons"

  #page werkwijze
  get "home/werkwijze"
  match "/werkwijze" => "home#werkwijze"

  #send subscribe email
  match "/send_subscribe_email_action" => "home#send_subscribe_email_action"

  #upload cv
  match "/upload_cv_action" => "home#upload_cv_action"

  #post entry on facebook / twitter / linked in
  get "home/post_facebook_action"
  match "post_facebook_action" => "home#post_facebook_action"
  get "home/post_twitter_action"
  match "post_twitter_action" => "home#post_twitter_action"
  get "home/post_linkedin_action"
  match "post_linkedin_action" => "home#post_linkedin_action"

  #page solliciteren
  get "home/solliciteren"
  post "home/solliciteren"
  match "/solliciteren" => "home#solliciteren"
  match "/solliciteren_action" => "home#solliciteren_action"  
  match "/sollicitatie_formulier_action" => "home#sollicitatie_formulier_action"

  

  root :to => 'home#index'

end
