Rails.application.routes.draw do
  devise_for :users

  unauthenticated :user do
    devise_scope :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end
end
