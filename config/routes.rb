Uplate::Application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  
  match 'tickets' => 'pages#tickets', as: :tickets
  
  resources :clips, except: :show
  resources :photos, except: :show
  
  scope "contents" do
    get 'edit' => "contents#edit", as: :edit_contents
    put 'update' => "contents#update", as: :update_contents
  end
  
  root to: 'pages#home'
end
