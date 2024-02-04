Rails.application.routes.draw do
  
  scope module: :public do
    root to: 'homes#top'
    get '/customers' => 'customers#show'
    get '/customers/information/:id/edit' => 'customers#edit'
    patch '/customers/information/:id' => 'customers#update'
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch '/customers/withdraw' => 'customers#withdraw'
    
    
    get '/about' => 'homes#about'
    get '/items' => 'items#index'
    get '/items/:id' => 'items#show'
    
  end
  
  namespace :admin do
    root to: 'homes#top'
  end
  
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}




devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
