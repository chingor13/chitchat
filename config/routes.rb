Chitchat::Application.routes.draw do
  resources :users do
    resource :status
    resources :calls
  end
end
