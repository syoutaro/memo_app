Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'memo' => 'pages#memo'
  get 'index'=>'pages#index'
  get "show/:id"=>'pages#show'
  post 'create' => 'pages#create'
end
