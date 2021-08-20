Rails.application.routes.draw do
  devise_for :admins, controllers: {
    path: '/admin',
    registrations: 'admin/admins/registrations',
    sessions: 'admin/admins/sessions',
    passwords: 'admin/admins/passwords'
  }

  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    passwords: 'public/users/passwords',
    registrations: 'public/users/registrations'
  }

  # Helperにadminをつけるためnamespaceを使う
  namespace  :admin do
    root to: 'homes#top'
    get 'admin/recipes', to: 'searches#index'
    get 'admin/searches', to: 'searches#search'
    resources :users, except: %i[create new destroy]
    resources :genres
    resources :recipes, only: %i[index show destroy] do
      collection do
        get 'genre_chart'
        get 'week_chart'
      end
      resources :reviews, only: %i[index destroy]
    end
    resources :contacts do
      member do
        patch 'status'
      end
    end
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    resources :contacts, only: %i[new create] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    resources :recipes do
      collection do
        get 'search'
        get 'ranking'
        get 'pv_ranking'
        get 'raty_ranking'
        get 'genre_ranking'
      end
      resources :bookmarks, only: %i[create destroy]
      resources :reviews, only: %i[create destroy index show]
      member do
        get 'recipe/genres', to: 'recipes#genre'
      end
    end
    resources :procedures, only: %i[new create]
    resources :users, only: [:update] do
      resource :relationships, only: %i[create destroy]
    end
    get 'my_page' => 'users#show'
    get 'my_page/edit' => 'users#edit'
    get 'my_page/cancel', to: 'users#cancel'
    patch 'my_page/unsubscribe', to: 'users#unsubscribe'
    get 'recipes', to: 'searches#index'
  end
end
