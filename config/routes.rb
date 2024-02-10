Rails.application.routes.draw do
  
  
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to: 'homes#top'
    
    resources :customers, only: [:show, :edit, :update, :confirm_withdraw, :withdraw]
    
    
    get '/about' => 'homes#about'
    get '/items' => 'items#index'
    get '/items/:id' => 'items#show'
    
  end
  
  namespace :admin do
    root to: 'homes#top'
    
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
