Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations: 'user/registrations'
    }

  namespace :admin do
    resources :users
    resources :posts
    get '/main', to: 'main#error'
  end
end
