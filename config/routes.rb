Rails.application.routes.draw do
  
 
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to: 'homes#top'
    
    resources :customers, only: [:edit, :update, :confirm_withdraw, :withdraw]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanx' => 'orders#thanx'
    resources :orders, only: [:new, :create, :index, :show]
    
    
    delete '/cart_items/delete_all' => 'cart_items#delete_all', as: 'delete_all_cart_items'
    get 'customers/' => 'customers#show'
    get '/about' => 'homes#about'
    get '/items' => 'items#index'
    get '/items/:id' => 'items#show',as: "item"
    
  end
  
  
  
  namespace :admin do
    root to: 'homes#top'
    
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
