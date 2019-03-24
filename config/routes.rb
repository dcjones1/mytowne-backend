Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :posts, except: [:new, :edit]
      resources :tags, only: [:create, :index]
      resources :post_tags, only: [:create, :destroy, :index]
    end
  end
end
