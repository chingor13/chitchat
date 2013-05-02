Chitchat::Application.routes.draw do
  resources :users do
    member do
      post :sign_on
      post :sign_off
    end
    resource :status
    resources :chats, :only => [:index]
  end

  resources :chats, :only => [:show, :create] do
    member do
      post :answer
      post :hang_up
    end
    resources :messages
  end
end
