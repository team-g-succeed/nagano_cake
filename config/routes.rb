Rails.application.routes.draw do
  devise_for :customers, :controllers => {
      :sessions => 'public/sessions',
      :registrations => 'public/registrations',
      :passwords => 'public/passwords'
  }
  
  root 'public/homes#top'
  get 'about' => 'public/homes#about'
  
  scope module: :customers do
    resources :items, only: [:index, :show]
    get 'edit/customers' => 'customers#edit'
    patch 'update/customers' => 'cutomers#update'
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
end