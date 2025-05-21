Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:new]
    end
end
