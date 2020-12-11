Rails.application.routes.draw do
  devise_for :users
    #get "pages/home"
    root :to => "gyms#show"

  
  #get "gyms/show", to: "gyms#show"
  
  
  #get "new_user_session_path", to: "gyms#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tickets

  # resources :users
  
  resources :gyms
  
  resources :trudy_trends
  #root 'tickets#index'
  namespace :charts do
    get "trends-by-day"
  end
  # resources :charts, only: [] do
  #   collection do
  #     get 'trends_by_days'
  #   end
  # end
end
