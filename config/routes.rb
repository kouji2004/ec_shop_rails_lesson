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
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :public do
    resources :items ,only: [:index,:show]
      resources :cart_items ,only: [:index,:create,:update,:destroy] do
        collection do
          delete 'all_destroy'
        end
      end
    post "/orders/log"=> "orders#log",as:"log"
    resources :orders, only: [:new]
    get "/about" => "homes#about", as: "about"
    root to: "homes#top"
  end
end
