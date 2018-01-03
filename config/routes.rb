Rails.application.routes.draw do

  resources :characters
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
    resources :npcs, except: [:index], controller: 'acts/npcs'
  end

  resources :chapters, except: [:index], controller: 'acts/chapters' do
    resources :challenges, except: [:index], controller: 'chapters/challenges'
  end

  resources :challenges, except: [:index], controller: 'chapters/challenges' do
    resources :player_actions, except: [:index], controller: 'challenges/player_actions'
  end

  resources :npcs, except: [:index], controller: 'acts/npcs'
  resources :player_actions, except: [:index], controller: 'challenges/player_actions'

  root 'home#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
