Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
    passwords: 'public/passwords'
  }

  root 'public/homes#top'
  get 'about' => 'public/homes#about'

  scope module: :public do
    resources :items, only: [:index, :show]
    get 'edit/customers' => 'customers#edit'
    patch 'update/customers' => 'customers#update'
  resources :customers, only:  [:show, :edit, :update] do
    collection do
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    end
  end
  
  resources :cart_items, only: [:index, :create, :destroy, :update] do
      collection do
        delete '/' => 'cart_items#destroy_all'
    end
  end
  
    resources :orders, only: [:new, :index, :show, :create] do
    collection do
      post 'confirm'
      get 'thanks'
    end
  end
  
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :customers
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    :sessions => 'admin/sessions',
  }
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :edit, :update,]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      member do
        get :order_details
        resource :order_details, only: [:update]
      end
     end
   end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
