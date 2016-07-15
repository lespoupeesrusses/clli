Rails.application.routes.draw do
  resources :teams
  devise_for :users
  resources :categories
  resources :resources do 
    post 'categorize/:category_id' => 'resources#categorize', as: :categorize
    post 'uncategorize/:category_id' => 'resources#uncategorize', as: :uncategorize
  end
  root 'categories#index'
end
