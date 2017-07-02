Rails.application.routes.draw do
  resources :artists do
    get 'suggestions', on: :collection
  end
  root to: 'artists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
