Rails.application.routes.draw do
  devise_for :users
  root 'homes#home'
  post '/memos/:id/update' => 'memos#update'
  post'/memos/:id/destroy' => 'memos#destroy'
  resources :memos
end
