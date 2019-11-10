Rails.application.routes.draw do
   post '/repositories/update_trending', to: 'repositories#update_trending'  
  resources :repositories

end
