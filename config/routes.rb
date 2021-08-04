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

  scope module: :admin do
    root to: 'homes#top'
    get 'searches', to: 'searches#search'
    get 'searches', to: 'searches#index'
    resources :users, except: [:create, :new, :destroy]
    resources :genres
    resources :recipes, only: [:index, :show, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    resources :bookmarks, only: [:create, :destroy]
    resources :recipes, only: [:create, :destroy]
    get 'confirm', to: 'recipes#confirm'
    resources :reviews, except: [:show, :edit, :update]
    resources :users, only: [:show, :edit, :update]
    get 'users/cancel', to: 'searches#cancel'
    get 'users/unsubscribe', to: 'searches#unsubscribe'
    get 'recipes', to: 'searches#index'
    get 'searches', to: 'searches#search'
    get 'rankings', to: 'rankings#index'
  end

end
