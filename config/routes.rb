Rails.application.routes.draw do
   root to: 'repositories'
   post '/repositories/update_trending', to: 'repositories#update_trending'  
   resources :repositories
end