Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, except: [:new, :edit]
      resources :tags
    end
  end
end
