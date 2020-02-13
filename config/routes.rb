Rails.application.routes.draw do
 
  #get 'the_gossip_project/contact'
  #get 'the_gossip_project/team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/the_gossip_project/team', to: 'the_gossip_project#team'

  get '/the_gossip_project/contact', to: 'the_gossip_project#contact'

  # get '/the_gossip_project/welcome/:id', to: 'the_gossip_project#welcome', as: 'the_gossip_project/welcome'

  # get '/the_gossip_project/welcome', to: 'the_gossip_project#welcome' 


  # get '/the_gossip_project/gossip/:id', to: 'the_gossip_project#gossip', as: 'the_gossip_project/gossip'

  resources :gossips do
    resources :comments, :likes
  end

  # get '/the_gossip_project/author/:id', to: 'the_gossip_project#author', as: 'the_gossip_project/author'

  resources :authors

  resources :cities

  resources :users

  resources :sessions, only: [:new, :create, :destroy]


end
