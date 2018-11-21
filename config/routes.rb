Rails.application.routes.draw do
  devise_for :children
  devise_for :parents

  root to: 'pages#home'


  get 'dashboard', to: 'parents#dashboard'
  get 'playground', to: 'children#playground'

  get '/children/new', to: 'children#new', as: :new_child
  post '/children', to: 'children#create', as: :child

  resources :tasks do
    resources :task_submissions, only: [:create, :new]
  end

  resources :rewards do
    resources :reward_requests, only: :create
  end
end


#root --- /


#devise -- runs log-in on your sites -- often used with user model--which stores the user database
#le-wagon template -- has auto built user into it but otherwise have create it yourself --through documentations

