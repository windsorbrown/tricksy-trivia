Rails.application.routes.draw do

  # get 'profiles/show'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'user/dash', to: 'pages#dash' , as: 'user/dashboard'  ####totallly temporary to check the user pages before i make another controller

  

  resources :user, only:[:create, :show]
  resource :session, only: [:create, :destroy]
  resources :questions, only: [:show] 
  

  # namespace :user do
  #   resource :profile
  # end


  root to: "pages#index"  ##### can be changed to whatever we feel is the right thing to do .
end

