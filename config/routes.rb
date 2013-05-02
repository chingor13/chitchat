Chitchat::Application.routes.draw do
  resources :users, :only => [:show] do
    member do
      post :sign_on
      post :sign_off
    end
    resources :chats, :only => [:index]
  end

  resources :chats, :only => [:show, :create] do
    member do
      post :answer
      post :hang_up
    end
    resources :messages, :only => [:create]
  end
end
