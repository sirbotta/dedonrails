Rails.application.routes.draw do

  resources :characters
  resources :actions
  devise_for :users

  get 'home/index'

  get 'my_adventures', to: 'adventures/my_adventures#index'
  get 'my_characters', to: 'characters/my_characters#index'

  resources :adventures do
    resources :acts, except: [:index], controller: 'adventures/acts'
    resources :parties, except: [:index], controller: 'adventures/parties'
  end

  resources :parties, except: [:index], controller: 'adventures/parties'

  resources :acts, except: [:index], controller: 'adventures/acts' do
    resources :chapters, except: [:index], controller: 'acts/chapters'
  end

  resources :chapters, except: [:index], controller: 'acts/chapters' do
    resources :challenges, except: [:index], controller: 'chapters/challenges'
  end

  root 'adventures/my_adventures#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
