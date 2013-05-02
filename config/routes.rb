Chitchat::Application.routes.draw do
  resources :users, :only => [:show] do
    member do
      put :sign_on
      put :sign_off
    end
    resources :chats, :only => [:index]
  end

  resources :chats, :only => [:show, :create] do
    member do
      put :answer
      put :hang_up
    end
    resources :messages, :only => [:index, :create]
  end
end
