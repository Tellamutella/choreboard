Rails.application.routes.draw do
  devise_for :children, controllers: { registrations: 'children/registrations' }
  devise_for :parents
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
