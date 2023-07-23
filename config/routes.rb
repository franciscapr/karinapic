Rails.application.routes.draw do
  devise_for :users
  root "pictures#index"
  
  resources :pictures, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end

  resources :users, only: [:edit, :update, :new, :create, :show, :index]

  # Agregamos la ruta para eliminar un comentario si también lo deseas
  resources :comments, only: [:index, :new, :create, :destroy]
  
end
