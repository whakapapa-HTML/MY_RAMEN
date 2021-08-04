Rails.application.routes.draw do
  devise_for :admins,controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
  
  devise_for :users, controllers: {
    registraions: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
 
end
