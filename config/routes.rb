Rails.application.routes.draw do
  root to: 'pages#home'
  #resources :chorus, only: [:index, :new, :create] #--method that generates 7 crud for route

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#root --- /


#devise -- runs log-in on your sites -- often used with user model--which stores the user database
#le-wagon template -- has auto built user into it but otherwise have create it yourself --through documentations

