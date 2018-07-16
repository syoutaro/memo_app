Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'memo' => 'pages#memo'
  get 'index'=>'pages#index'
  get 'memo/:id'=>'pages#show'
  get 'memo/:id/edit' => 'pages#edit'
  post 'create' => 'pages#create'
  post 'memo/:id/update' => 'pages#update'
  post 'memo/:id/destroy' => 'pages#destroy'
end
