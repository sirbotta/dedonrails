Rails.application.routes.draw do

  devise_for :users

  get 'home/index'

  resources :acts do
    resources :chapters, shallow: true do
      resources :challenges, shallow: true
    end
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
