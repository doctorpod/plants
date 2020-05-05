Rails.application.routes.draw do
  resources :seeds do
    resources :sowings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
