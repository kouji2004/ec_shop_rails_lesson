Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :items, only: [:new,:create,:index,:show,:edit,:update]
    resources :genres, only: [:index,:create]
  end

  scope module: :public do
    resources :items ,only: [:index,:show]
    get "/about" => "homes#about", as: "about"
    root to: "homes#top"
  end
end
