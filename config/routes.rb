Rails.application.routes.draw do
  devise_for :users
    #get "pages/home"
    root :to => "gyms#show"
  
  #get "gyms/show", to: "gyms#show"
  
  
  #get "new_user_session_path", to: "gyms#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tickets
  resources :products, :only => [:index, :show]
  
  #root 'tickets#index'
end
