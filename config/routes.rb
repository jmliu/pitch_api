Rails.application.routes.draw do

  get '/games', to: 'games#index' # list all games
  get '/games/:game_id', to: 'games#show' # list pitchers that pitched in this game

  get '/pitchers', to: 'pitchers#index' # list all pitchers
  get '/pitchers/:mlb_id', to: 'pitchers#show' # pitcher with games pitched and his pitch types

  get '/pitch-types', to: 'pitch_types#index' # list all pitch types
  get '/pitch-types/:pitch_type/pitchers', to: 'pitch_types#pitchers' # list pitchers with this pitch type
  get '/pitch-types/:pitch_type/pitchers/:mlb_id', to: 'pitch_types#pitcher' # pitcher with this pitch type

  root to: 'application#index'
end
