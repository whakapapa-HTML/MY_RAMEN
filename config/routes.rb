Rails.application.routes.draw do

  devise_for :admins,controllers: {
    path: "/admin",
    registrations: 'admin/admins/registrations',
    sessions: 'admin/admins/sessions',
    passwords: 'admin/admins/passwords'
  }

  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    passwords: 'public/users/passwords',
    registrations: 'public/users/registrations'
  }

  #Helperにadminをつけるためnamespaceを使う
  namespace  :admin do
    root to: 'homes#top'
    get 'admin/recipes', to: 'searches#index'
    get 'admin/searches', to: 'searches#search'
    resources :users, except: [:create, :new, :destroy]
    resources :genres
    resources :recipes, only: [:index, :show, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    resources :bookmarks, only: [:create, :destroy]
    resources :recipes do
      member do
         get 'recipe/genres', to: 'recipes#genre'
      end
    end
    resources :procedures, only: [:new, :create]
    resources :reviews, except: [:show, :edit, :update]
    resources :users, only: [:show, :edit, :update]
    get 'user/cancel', to: 'users#cancel'
    get 'user/unsubscribe', to: 'users#unsubscribe'
    get 'recipes', to: 'searches#index'
    get 'user/searches', to: 'searches#search'
    get 'rankings', to: 'rankings#index'
  end

end
