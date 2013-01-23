Dimarsec::Application.routes.draw do
  #page home index
  get "home/index"

  #page webformulier
  get "home/webformulier"
  match "webformulier" => "home#webformulier"

  #page klant_worden
  get "home/klant_worden"
  post "home/klant_worden"
  match "/klant_worden" => "home#klant_worden"

  #page over_ons
  get "home/over_ons"
  match "/over_ons" => "home#over_ons"

  #page werkwijze
  get "home/werkwijze"
  match "/werkwijze" => "home#werkwijze"

  #page solliciteren
  get "home/solliciteren"
  post "home/solliciteren"
  match "/solliciteren" => "home#solliciteren"
  match "/solliciteren_action" => "home#solliciteren_action"  
  match "/sollicitatie_formulier_action" => "home#sollicitatie_formulier_action"

  

  root :to => 'home#index'

end
