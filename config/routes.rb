Rails.application.routes.draw do

  resources :games
  # get 'profiles/show'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'user/dash', to: 'users#show' , as: 'user/dashboard'  ####totallly temporary to check the user pages before i make another controller

  

  resources :users, only:[:show, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :questions, only: [:show] 
  resources :answer, only: [:update]
  

  # namespace :user do
  #   resource :profile
  # end


  root to: "pages#index"  ##### can be changed to whatever we feel is the right thing to do .
end

