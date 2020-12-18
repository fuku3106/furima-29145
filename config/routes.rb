Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:new, :edit, :show]
end
