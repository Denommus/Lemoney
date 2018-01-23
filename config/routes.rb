Rails.application.routes.draw do
  resources :offers do
    member do
      put 'toggle_disable'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
