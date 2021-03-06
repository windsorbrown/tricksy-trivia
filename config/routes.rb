Rails.application.routes.draw do

   # get 'profiles/show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get 'auth/:provider/callback', to: 'sessions#create_social'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'user/dash', to: 'users#show' , as: 'user/dashboard'  ####totallly temporary to check the user pages before i make another controller
   #get 'games/:id/players', to: 'games#players'

  get 'static/page', to: 'pages#static'

  resources :users, only:[:show, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :questions, only: [:show]
  resources :players, only: [:destroy]

  resources :games do
    get '/finish', to: 'games#finish'
    resources :user_answers, only: [:create]
    resources :players, only: [:create, :destroy]
    get '/play', to: 'games#play'
    get '/play_game', to: 'games#play_game'
  end


  # namespace :user do
  #   resource :profile
  # end


  root to: "pages#index"  ##### can be changed to whatever we feel is the right thing to do .
end
