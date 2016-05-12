Rails.application.routes.draw do
  # get 'sessions/new'

  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  root to: "questions#show"  ##### can be changed to whatever we feel is the right thing to do .
end
