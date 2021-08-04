Rails.application.routes.draw do
  devise_for :admins,controllers: {
    path: "/admin",
    registrations: 'admin/admins/registrations',
    sessions: 'admin/admins/sessions',
    passwords: 'admin/admins/passwords'
  }

  devise_for :users, controllers: {
    registraions: 'public/users/registrations',
    sessions: 'public/users/sessions',
    passwords: 'public/users/passwords'
  }

end
