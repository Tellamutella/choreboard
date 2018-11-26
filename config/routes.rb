Rails.application.routes.draw do
  devise_for :children
  devise_for :parents

  root to: 'pages#home'

  get 'dashboard', to: 'parents#dashboard'
  get 'playground', to: 'children#playground'

  # get '/children/new', to: 'children#new', as: :new_child
  post '/children', to: 'children#create', as: :add_child

  resources :tasks do
    resources :task_submissions, only: [:create, :new, :update]
  end

  resources :rewards do
    resources :reward_requests, only: [:create, :new, :update]
  end

  # resources :parents do
  #   resources :children, only:[:new]
  #   resources :children, only: :create, as: :create_child
  # end
end
