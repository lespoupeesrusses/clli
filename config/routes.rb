Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  resources :teams
  resources :users, only: [:index, :show]
  resources :categories
  resources :resources do 
    post 'categorize/:category_id' => 'resources#categorize', as: :categorize
    post 'uncategorize/:category_id' => 'resources#uncategorize', as: :uncategorize
  end
  root 'categories#index'
end
