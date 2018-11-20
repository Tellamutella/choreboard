Rails.application.routes.draw do
  devise_for :children, controllers: { registrations: 'children/registrations' }
  devise_for :parents
  root to: 'pages#home'

  get 'dashboard', to: 'parents#dashboard'
  get 'playground', to: 'children#playground'

  resources :tasks do
    resources :task_submissions, only: :create
  end

  resources :rewards do
    resources :reward_requests, only: :create
  end
end
