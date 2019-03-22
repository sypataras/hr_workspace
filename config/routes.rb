Rails.application.routes.draw do
  root to: 'admin/main#root'

  devise_for :users,
    controllers: {
      registrations: 'user/registrations'
    }

  namespace :admin do
    resources :users
    resources :posts
    get '/main', to: 'main#error'
  end

  resources :posts, only: [:index, :show]
end
